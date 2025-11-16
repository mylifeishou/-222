# MCP (Model Context Protocol) 설정 가이드

GitHub MCP를 연동하여 Cursor에서 직접 GitHub 작업을 수행할 수 있습니다.

## 설정 방법

### 1. GitHub Personal Access Token 생성

1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. "Generate new token (classic)" 클릭
3. 다음 권한 선택:
   - `repo` (전체 리포지토리 접근)
   - `workflow` (GitHub Actions 워크플로 수정)
   - `pages` (GitHub Pages 관리)
4. 토큰 생성 후 복사 (한 번만 표시됨!)

### 2. Cursor에서 MCP 설정

#### 방법 A: Cursor 설정 UI 사용

1. Cursor → Settings (Ctrl+,)
2. "MCP" 또는 "Model Context Protocol" 검색
3. "Add MCP Server" 클릭
4. 다음 설정 추가:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN_HERE"
      }
    }
  }
}
```

#### 방법 B: 설정 파일 직접 수정

1. Cursor 설정 파일 위치 확인:
   - Windows: `%APPDATA%\Cursor\User\settings.json`
   - 또는 Cursor → Settings → Open Settings (JSON)

2. 다음 설정 추가:

```json
{
  "mcp": {
    "servers": {
      "github": {
        "command": "npx",
        "args": [
          "-y",
          "@modelcontextprotocol/server-github"
        ],
        "env": {
          "GITHUB_PERSONAL_ACCESS_TOKEN": "YOUR_TOKEN_HERE"
        }
      }
    }
  }
}
```

### 3. Cursor 재시작

설정 후 Cursor를 완전히 종료하고 다시 시작하세요.

## 확인 방법

MCP가 정상적으로 연동되었는지 확인:

1. Cursor에서 MCP 도구 사용 시도
2. GitHub 레포지토리 작업이 가능한지 확인

## 문제 해결

### "MCP server 'github' is not available" 오류

- Cursor 재시작 확인
- GitHub Personal Access Token이 올바른지 확인
- Node.js가 설치되어 있는지 확인 (`npx` 명령어 사용)

### 토큰 권한 오류

- GitHub에서 토큰 권한 확인
- `repo`, `workflow`, `pages` 권한이 모두 있는지 확인

## 참고

- GitHub MCP 공식 문서: https://github.com/modelcontextprotocol/servers/tree/main/src/github
- MCP 개요: https://modelcontextprotocol.io/

