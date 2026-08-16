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
            $dst = Join-Path $InstallDir $bin
            Copy-Item $src $dst -Force
            # Files downloaded via Invoke-WebRequest carry a "mark of the web"
            # tag that can make Windows SmartScreen block an unsigned alpha
            # .exe from running, with no clear error -- looks like nothing
            # got installed.
            Unblock-File -Path $dst -ErrorAction SilentlyContinue
        }
    }

    Write-Host "Installed Minerva alpha binaries to $InstallDir"

    # $HOME\.local\bin is not on PATH by default -- the binaries are really
    # there, but a fresh terminal can't find them, which looks identical to
    # "the installer didn't install anything."
    $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $pathEntries = @()
    if ($userPath) { $pathEntries = $userPath -split ";" | Where-Object { $_ -ne "" } }
    if ($pathEntries -notcontains $InstallDir) {
        $newUserPath = if ($userPath) { "$userPath;$InstallDir" } else { $InstallDir }
        [Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")
        $env:Path = "$env:Path;$InstallDir"
        Write-Host "$InstallDir was not on your PATH -- added it (a new terminal picks it up)."
    }

    # The whole point: an install that ends with a running dashboard already
    # open in the browser, not a binary sitting in a folder and an address
    # the user has to go find themselves.
    Write-Host ""
    Write-Host "Starting Minerva..."
    $foundationExe = Join-Path $InstallDir "foundation.exe"
    & $foundationExe dashboard
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Minerva is running. The dashboard should have opened in your browser."
    } else {
        Write-Host ""
        Write-Host "Couldn't start it automatically. Run this yourself:"
        Write-Host ""
        Write-Host "  $foundationExe dashboard"
        Write-Host ""
    }
}
finally {
    Remove-Item -Recurse -Force $TempDir -ErrorAction SilentlyContinue
}
