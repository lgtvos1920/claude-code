# Check if uv is available
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "uv not found in current PATH, attempting to add default install location..."
    $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
    
    if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
        Write-Host "uv is still not found. Installing uv now..."
        irm https://astral.sh/uv/install.ps1 | iex
        $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
    }
}

Write-Host "`nInstalling free-claude-code globally..."
uv tool install .

Write-Host "`n=======================================================" -ForegroundColor Green
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "You can now use fcc-claude, fcc-server, etc. from anywhere."
Write-Host "IMPORTANT: You MUST close this terminal and open a new one first!" -ForegroundColor Yellow
Write-Host "=======================================================" -ForegroundColor Green
