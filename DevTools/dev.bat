@ECHO OFF
:: Prevent path duplication if run multiple times in the same window
IF DEFINED _MY_PATHS_LOADED GOTO :END

:: Build base paths safely line-by-line to prevent multiline syntax crashes
SET "ADD_PATHS=C:\DevTools\Bin"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\vscode\bin"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\nodejs"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\nodejs\node_modules\npm\bin"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\golang\bin"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\cmake\bin"
SET "ADD_PATHS=%ADD_PATHS%;C:\DevTools\vcpkg"




:: Check if the first argument (%1) passed to the script is "gnu"
IF /I "%~1"=="gnu" (
    SET "ADD_PATHS=%ADD_PATHS%;C:\msys64\ucrt64\bin"
    SET "ADD_PATHS=%ADD_PATHS%;C:\msys64\usr\bin"
)

SET "PATH=%PATH%;%ADD_PATHS%"
SET _MY_PATHS_LOADED=1

:END
@ECHO ON
