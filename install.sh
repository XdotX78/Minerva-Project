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
  *)
    echo "unsupported platform for this alpha release: $platform $arch" >&2
    echo "check the releases page for manual install options" >&2
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
  fi
done

echo "Installed Minerva alpha binaries to $INSTALL_DIR"
echo "Current command name: foundation"
echo "Next step: run 'foundation --version' or 'foundation doctor'"
