#!/usr/bin/env bash
set -euo pipefail

REPO="XdotX78/Minerva-Project"
VERSION="${MINERVA_VERSION:-latest}"
INSTALL_DIR="${MINERVA_INSTALL_DIR:-$HOME/.local/bin}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

platform="$(uname -s)"
arch="$(uname -m)"

case "$platform:$arch" in
  Linux:x86_64)
    asset="minerva-linux-x86_64.tar.gz"
    ;;
  Darwin:arm64)
    asset="minerva-macos-aarch64.tar.gz"
    ;;
  *)
    echo "unsupported platform for this alpha release: $platform $arch" >&2
    echo "for Windows use install.ps1; otherwise check the releases page for manual install options" >&2
    exit 1
    ;;
esac

if [[ "$VERSION" == "latest" ]]; then
  base_url="https://github.com/$REPO/releases/latest/download"
else
  base_url="https://github.com/$REPO/releases/download/$VERSION"
fi

archive_path="$TMP_DIR/$asset"
checksums_path="$TMP_DIR/SHA256SUMS"

echo "Downloading $asset"
curl -fsSL "$base_url/$asset" -o "$archive_path"
curl -fsSL "$base_url/SHA256SUMS" -o "$checksums_path"

(
  cd "$TMP_DIR"
  grep " $asset\$" SHA256SUMS | sha256sum -c -
)

mkdir -p "$INSTALL_DIR"
tar -xzf "$archive_path" -C "$TMP_DIR"

for bin in foundation foundation-capture foundation-summarize foundation-import foundation-review foundation-discover foundation-recover foundation-snapshot foundation-session-queue foundation-synthesize foundation-trigger foundation-migrate; do
  if [[ -f "$TMP_DIR/$bin" ]]; then
    install -m 755 "$TMP_DIR/$bin" "$INSTALL_DIR/$bin"
    # macOS quarantines anything extracted from a curl'd download; an
    # unsigned/unnotarized alpha binary can get silently blocked from the
    # terminal otherwise, with no clear error -- looks like "nothing happened."
    if [[ "$platform" == "Darwin" ]]; then
      xattr -d com.apple.quarantine "$INSTALL_DIR/$bin" 2>/dev/null || true
    fi
  fi
done

echo "Installed Minerva alpha binaries to $INSTALL_DIR"

# $HOME/.local/bin is not on PATH by default on a fresh macOS or Linux
# machine -- the binaries are really there, but the shell can't find
# them, which looks identical to "the installer didn't install anything."
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  shell_name="$(basename "${SHELL:-bash}")"
  case "$shell_name" in
    zsh) rc_file="$HOME/.zshrc" ;;
    bash) rc_file="$HOME/.bashrc" ;;
    *) rc_file="$HOME/.profile" ;;
  esac
  export_line="export PATH=\"$INSTALL_DIR:\$PATH\""
  if [[ ! -f "$rc_file" ]] || ! grep -qF "$export_line" "$rc_file" 2>/dev/null; then
    printf '\n# added by the Minerva installer\n%s\n' "$export_line" >> "$rc_file"
  fi
  echo "$INSTALL_DIR was not on your PATH -- added it to $rc_file (a new terminal picks it up)."
  export PATH="$INSTALL_DIR:$PATH"
fi

foundation_bin="$INSTALL_DIR/foundation"

# Unlike Windows/macOS, `foundation start` on Linux expects the systemd
# --user unit to already exist -- it doesn't write it on first start the way
# the other two platforms self-bootstrap their service. Safe to repeat.
if [[ "$platform" == "Linux" ]]; then
  "$foundation_bin" service install-user >/dev/null 2>&1 || true
fi

# The whole point: an install that ends with a running dashboard already
# open in the browser, not a binary sitting in a folder and an address the
# user has to go find themselves.
echo ""
echo "Starting Minerva..."
if "$foundation_bin" dashboard; then
  echo "Minerva is running. The dashboard should have opened in your browser."
else
  echo ""
  echo "Couldn't start it automatically. Run this yourself:"
  echo ""
  echo "  $foundation_bin dashboard"
  echo ""
fi
