@echo off
REM Check if uv is in PATH
uv --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo uv not found, adding default install path to PATH...
    set "PATH=%USERPROFILE%\.local\bin;%PATH%"
    uv --version >nul 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        echo uv is still not found. Please install uv first or run start_server.ps1 to install it automatically.
        pause
        exit /b 1
)

echo Installing/updating claude-code...
call npm install -g @anthropic-ai/claude-code

echo Starting fcc-server...
uv run fcc-server
pause
