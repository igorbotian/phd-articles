@echo off
set RELATIVE_DIR = %~dp0
cd RELATIVE_DIR

set MASTER_DOCUMENT=article
set SCRIPT_DIR=%~dp0
set SRC_DIR=%SCRIPT_DIR%\src
set OUTPUT_DIR=%SRC_DIR%\..\target
set PDF_FILE_NAME=article

if exist %SCRIPT_DIR%\%PDF_FILE_NAME%.pdf (
    del %SCRIPT_DIR%\%PDF_FILE_NAME%.pdf
)

if not exist %OUTPUT_DIR% (
    mkdir %OUTPUT_DIR%
)

cd %SRC_DIR%
call:call_pdflatex
cd %SRC_DIR%

:call_pdflatex 
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=%OUTPUT_DIR% %MASTER_DOCUMENT%
goto:eof