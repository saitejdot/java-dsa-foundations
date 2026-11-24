$ErrorActionPreference = "Continue"

$repositoryRoot = $PSScriptRoot
$remoteName = "origin"
$branchName = "main"
$watcher = New-Object System.IO.FileSystemWatcher

Set-Location $repositoryRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git is not available in PATH."
    exit 1
}

$watcher.Path = $repositoryRoot
$watcher.Filter = "*"
$watcher.IncludeSubdirectories = $true
$watcher.NotifyFilter = [System.IO.NotifyFilters]::FileName `
    -bor [System.IO.NotifyFilters]::LastWrite `
    -bor [System.IO.NotifyFilters]::DirectoryName
$watcher.EnableRaisingEvents = $true

Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Java practice auto-push watcher started."

try {
    while ($true) {
        $change = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::All)
        if ($change.Name -match '(^|[\\/])\.git([\\/]|$)') {
            continue
        }

        # Wait for the save burst to finish before checking Git status.
        do {
            $change = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::All, 1000)
        } while (-not $change.TimedOut)

        $status = git status --porcelain
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Unable to read Git status."
            continue
        }

        if (-not $status) {
            continue
        }

        git add .
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git add failed."
            continue
        }

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        git commit -m "Practice update: $timestamp"
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git commit failed."
            continue
        }

        git push $remoteName $branchName
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git push failed."
            continue
        }

        Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Practice changes pushed to GitHub."
    }
} finally {
    $watcher.EnableRaisingEvents = $false
    $watcher.Dispose()
}
