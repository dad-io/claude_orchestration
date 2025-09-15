#!/usr/bin/env bash
set -euo pipefail
echo "[Hook] PostToolUse: format/lint (best‑effort)"
# Python
if compgen -G "*.py" >/dev/null; then
  command -v black >/dev/null 2>&1 && black . || true
  command -v ruff  >/dev/null 2>&1 && ruff check --fix . || true
fi
# TypeScript/JS/HTML/CSS
if [ -f "package.json" ]; then
  if command -v pnpm >/dev/null 2>&1; then
    pnpm -s dlx prettier -w . || true
    pnpm -s dlx eslint . --fix || true
  else
    npx --yes prettier -w . || true
    npx --yes eslint . --fix || true
  fi
fi
# Rust
if [ -f "Cargo.toml" ]; then
  command -v cargo >/dev/null 2>&1 && cargo fmt || true
  command -v cargo >/dev/null 2>&1 && cargo clippy -q || true
fi
exit 0
