# Claude Config

Claude Code 전역 설정 관리.

## 구조

```
settings.json   — 전역 설정 (모델, 권한, 훅, env)
agents/
  backend-engineer.md   — FastAPI + LangGraph 백엔드 전문가
  frontend-engineer.md  — React + TypeScript 프론트엔드 전문가
  code-reviewer.md      — 코드 리뷰 전문가
```

## 설치

```bash
git clone https://github.com/Minsu0814/claude-config.git
cd claude-config
bash install.sh
```

## 포함된 설정

- **모델**: Opus
- **권한**: Read/Edit 전체 허용, rm -rf / .env 차단
- **훅**: Windows 토스트 알림
- **에이전트 팀**: backend, frontend, code-reviewer
