@echo off
cd /d "%~dp0"

REM Git 경로 찾기
set GIT_CMD=
if exist "C:\Program Files\Git\cmd\git.exe" (
    set "GIT_CMD=C:\Program Files\Git\cmd\git.exe"
) else if exist "C:\Program Files (x86)\Git\cmd\git.exe" (
    set "GIT_CMD=C:\Program Files (x86)\Git\cmd\git.exe"
) else (
    REM PATH에서 git 찾기
    where git >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        set "GIT_CMD=git"
    ) else (
        echo Git을 찾을 수 없습니다. Git을 설치하거나 PATH에 추가해주세요.
        pause
        exit /b 1
    )
)

echo Git 경로: %GIT_CMD%
echo.

"%GIT_CMD%" init
"%GIT_CMD%" add .
"%GIT_CMD%" commit -m "랜딩페이지 초기 구현 - plans 기반 완성" 2>nul
"%GIT_CMD%" branch -M main
"%GIT_CMD%" remote add origin https://github.com/mylifeishou/-222.git 2>nul
"%GIT_CMD%" remote set-url origin https://github.com/mylifeishou/-222.git
"%GIT_CMD%" push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo 1차 푸시 실패. 원격 변경이 있을 수 있어 --force로 재시도합니다...
    "%GIT_CMD%" push -u origin main --force
    if %ERRORLEVEL% NEQ 0 (
        echo.
        echo 강제 푸시도 실패했습니다. 터미널에서 수동 확인이 필요합니다.
        pause
        exit /b 1
    ) else (
        echo.
        echo 강제 푸시 성공.
    )
) else (
    echo.
    echo 푸시 성공.
)

