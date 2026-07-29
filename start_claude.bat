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
)

echo Starting fcc-claude...
uv run fcc-claude
pause
