@echo off
echo Check if uv is in PATH...
uv --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo uv not found, adding default install path to PATH...
    set "PATH=%USERPROFILE%\.local\bin;%PATH%"
    uv --version >nul 2>&1
    IF %ERRORLEVEL% NEQ 0 (
        echo uv is still not found. Installing uv now...
        powershell -Command "irm https://astral.sh/uv/install.ps1 | iex"
        set "PATH=%USERPROFILE%\.local\bin;%PATH%"
    )
)

echo.
echo Installing free-claude-code globally...
uv tool install .

echo.
echo =======================================================
echo Installation complete! 
echo You can now use fcc-claude from anywhere.
echo IMPORTANT: Close this terminal and open a new one first!
echo =======================================================
pause
