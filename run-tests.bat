@echo off
REM Helper script to run tests and open reports on Windows

setlocal enabledelayedexpansion

REM Define colors using ANSI escape codes (requires Windows 10+)
set "BLUE=[94m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "RESET=[0m"

echo %BLUE%╔════════════════════════════════════════════════╗%RESET%
echo %BLUE%║  Robot Framework Test Runner                  ║%RESET%
echo %BLUE%╚════════════════════════════════════════════════╝%RESET%
echo.

REM Parse arguments
set "TEST_PATH=tests"
if not "%1"=="" set "TEST_PATH=%1"

if "%2"=="--dryrun" (
    echo %YELLOW%Running in DRY RUN mode (syntax validation only)%RESET%
    robot --dryrun "%TEST_PATH%"
    if errorlevel 1 (
        echo %YELLOW%Syntax validation failed!%RESET%
        exit /b 1
    ) else (
        echo %GREEN%Syntax validation passed!%RESET%
        exit /b 0
    )
)

REM Run tests
echo %BLUE%Running tests from: %TEST_PATH%%RESET%
echo.

robot "%TEST_PATH%"
set "ROBOT_EXIT=%errorlevel%"

echo.
if %ROBOT_EXIT% equ 0 (
    echo %GREEN%Tests completed successfully!%RESET%
) else (
    echo %YELLOW%Some tests failed. Check log.html for details.%RESET%
)

echo.
echo %BLUE%╔════════════════════════════════════════════════╗%RESET%
echo %BLUE%║  Reports Generated                            ║%RESET%
echo %BLUE%╚════════════════════════════════════════════════╝%RESET%
echo.

REM List generated files
if exist "report.html" (
    echo %GREEN%✓ report.html%RESET% (Summary report)
)

if exist "log.html" (
    echo %GREEN%✓ log.html%RESET% (Detailed log with screenshots)
)

if exist "output.xml" (
    echo %GREEN%✓ output.xml%RESET% (Machine-readable results)
)

echo.
echo Opening reports in browser...
echo.

REM Open reports
if exist "report.html" (
    start report.html
    echo %GREEN%→ report.html%RESET%
)

if exist "log.html" (
    start log.html
    echo %GREEN%→ log.html%RESET%
)

echo.
echo %BLUE%For more information, see REPORTS.md%RESET%
echo.
