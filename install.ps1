$ErrorActionPreference = "Stop"

$Repo = "XdotX78/Minerva-Project"
$Version = if ($env:MINERVA_VERSION) { $env:MINERVA_VERSION } else { "latest" }
$InstallDir = if ($env:MINERVA_INSTALL_DIR) { $env:MINERVA_INSTALL_DIR } else { Join-Path $HOME ".local\bin" }
$TempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("minerva-install-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $TempDir | Out-Null

try {
    if ($Version -eq "latest") {
        $BaseUrl = "https://github.com/$Repo/releases/latest/download"
    } else {
        $BaseUrl = "https://github.com/$Repo/releases/download/$Version"
    }

    $Asset = "minerva-windows-x86_64.zip"
    $ArchivePath = Join-Path $TempDir $Asset
    $ChecksumsPath = Join-Path $TempDir "SHA256SUMS"

    Write-Host "Downloading $Asset"
    Invoke-WebRequest -Uri "$BaseUrl/$Asset" -OutFile $ArchivePath
    Invoke-WebRequest -Uri "$BaseUrl/SHA256SUMS" -OutFile $ChecksumsPath

    $expected = (Get-Content $ChecksumsPath | Where-Object { $_ -match " $Asset$" }).Split(" ")[0]
    $actual = (Get-FileHash $ArchivePath -Algorithm SHA256).Hash.ToLowerInvariant()
    if ($actual -ne $expected.ToLowerInvariant()) {
        throw "checksum mismatch for $Asset"
    }

    New-Item -ItemType Directory -Force -Path $InstallDir | Out-Null
    Expand-Archive -Path $ArchivePath -DestinationPath $TempDir -Force

    $bins = @(
        "foundation.exe",
        "foundation-capture.exe",
        "foundation-summarize.exe",
        "foundation-import.exe",
        "foundation-review.exe",
        "foundation-discover.exe",
        "foundation-recover.exe",
        "foundation-snapshot.exe",
        "foundation-session-queue.exe",
        "foundation-synthesize.exe",
        "foundation-trigger.exe",
        "foundation-migrate.exe"
    )

    foreach ($bin in $bins) {
        $src = Join-Path $TempDir $bin
        if (Test-Path $src) {
            Copy-Item $src (Join-Path $InstallDir $bin) -Force
        }
    }

    Write-Host "Installed Minerva alpha binaries to $InstallDir"
    Write-Host "Current command name: foundation"
    Write-Host "Next step: run 'foundation --version' or 'foundation doctor'"
}
finally {
    Remove-Item -Recurse -Force $TempDir -ErrorAction SilentlyContinue
}
