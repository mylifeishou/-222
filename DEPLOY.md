# 배포 가이드

## Git이 설치되지 않은 경우

1. **Git 설치**: https://git-scm.com/download/win 에서 다운로드
2. 설치 후 PowerShell을 재시작하세요

## 배포 방법

### 방법 1: 배치 파일 사용 (권장)

`push.bat` 파일을 더블클릭하거나 터미널에서 실행:

```bash
cd docs\landing-page
push.bat
```

### 방법 2: 수동 배포

PowerShell 또는 CMD에서 다음 명령어를 실행:

```bash
cd docs\landing-page

# Git 저장소 초기화
git init

# 모든 파일 추가
git add .

# 커밋
git commit -m "랜딩페이지 초기 구현 - plans 기반 완성"

# main 브랜치로 설정
git branch -M main

# 원격 저장소 추가
git remote add origin https://github.com/mylifeishou/vibe-landing-page.git

# 푸시
git push -u origin main
```

### 방법 3: GitHub Desktop 사용

1. GitHub Desktop 설치: https://desktop.github.com/
2. File → Add Local Repository
3. `docs\landing-page` 폴더 선택
4. Publish repository 클릭

## GitHub Pages 설정

푸시 후:

1. GitHub 레포지토리로 이동: https://github.com/mylifeishou/vibe-landing-page
2. Settings → Pages
3. Source: "GitHub Actions" 선택
4. 저장

자동으로 배포가 시작됩니다!

## 문제 해결

### "git을 찾을 수 없습니다" 오류

- Git이 설치되어 있는지 확인
- PowerShell을 재시작
- Git 설치 경로가 PATH에 포함되어 있는지 확인

### "remote origin already exists" 오류

다음 명령어로 해결:

```bash
git remote remove origin
git remote add origin https://github.com/mylifeishou/vibe-landing-page.git
```

### 푸시 권한 오류

- GitHub Personal Access Token 사용 필요
- 또는 GitHub Desktop 사용 권장

