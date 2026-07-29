# Check if uv is available
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "uv not found in current PATH, attempting to add default install location..."
    $env:Path = "$env:USERPROFILE\.local\bin;$env:Path"
    
    if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
        Write-Host "uv is still not found. Please install uv using start_server.ps1 first."
        exit 1
    }
}

Write-Host "Starting fcc-claude..."
uv run fcc-claude
