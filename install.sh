#!/bin/bash
# Claude Config Installer
# 전역 settings + agents를 ~/.claude/에 심볼릭 링크로 연결

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "=== Claude Config 설치 ==="

# settings.json 링크
if [ -f "$CLAUDE_DIR/settings.json" ]; then
  echo "[skip] ~/.claude/settings.json 이미 존재 — 수동으로 병합하세요"
else
  ln -s "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"
  echo "[done] settings.json → ~/.claude/settings.json"
fi

# agents 링크
for agent_file in "$SCRIPT_DIR/agents"/*.md; do
  agent_name=$(basename "$agent_file")
  target="$CLAUDE_DIR/agents/$agent_name"
  if [ -f "$target" ]; then
    echo "[skip] agents/$agent_name 이미 존재"
  else
    mkdir -p "$CLAUDE_DIR/agents"
    ln -s "$agent_file" "$target"
    echo "[done] agents/$agent_name → ~/.claude/agents/$agent_name"
  fi
done

echo "=== 설치 완료 ==="
