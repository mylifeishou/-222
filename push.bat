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
"%GIT_CMD%" commit -m "랜딩페이지 초기 구현 - plans 기반 완성"
"%GIT_CMD%" branch -M main
"%GIT_CMD%" remote add origin https://github.com/mylifeishou/vibe-landing-page.git 2>nul
"%GIT_CMD%" remote set-url origin https://github.com/mylifeishou/vibe-landing-page.git
"%GIT_CMD%" push -u origin main

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo 푸시 중 오류가 발생했습니다. 
    echo 이미 레포지토리가 있다면 다음 명령어를 시도해보세요:
    echo "%GIT_CMD%" push -u origin main --force
    pause
)

