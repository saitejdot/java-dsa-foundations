$ErrorActionPreference = "Continue"

$repositoryRoot = $PSScriptRoot
$remoteName = "origin"
$branchName = "main"
$intervalSeconds = 60

Set-Location $repositoryRoot

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git is not available in PATH."
    exit 1
}

Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Java practice auto-push watcher started."

while ($true) {
    $status = git status --porcelain

    if ($LASTEXITCODE -ne 0) {
        Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Unable to read Git status."
    } elseif ($status) {
        git add .
        if ($LASTEXITCODE -ne 0) {
            Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git add failed."
        } else {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            git commit -m "Practice update: $timestamp"
            if ($LASTEXITCODE -ne 0) {
                Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git commit failed."
            } else {
                git push $remoteName $branchName
                if ($LASTEXITCODE -ne 0) {
                    Write-Error "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Git push failed."
                } else {
                    Write-Host "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] Practice changes pushed to GitHub."
                }
            }
        }
    }

    Start-Sleep -Seconds $intervalSeconds
}
