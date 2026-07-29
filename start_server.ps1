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

Write-Host "Installing/updating claude-code..."
npm install -g @anthropic-ai/claude-code

Write-Host "Starting fcc-server..."
uv run fcc-server
