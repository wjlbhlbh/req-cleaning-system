#!/usr/bin/env bash
# 需求清洗系统 - 安装脚本
# 将 skills 安装到 ~/.claude/skills/ 和 ~/.codex/skills/
# 将 templates 安装到 ~/.claude/templates/req-system/ 和 ~/.codex/templates/req-system/

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
TEMPLATES_SRC="$SCRIPT_DIR/templates"

echo "=== 需求清洗系统 安装脚本 ==="
echo ""

# 安装到 Claude Code
CLAUDE_SKILLS="$HOME/.claude/skills"
CLAUDE_TEMPLATES="$HOME/.claude/templates/req-system"

echo "[1/4] 安装 skills 到 $CLAUDE_SKILLS ..."
mkdir -p "$CLAUDE_SKILLS"
cp "$SKILLS_SRC"/*.md "$CLAUDE_SKILLS/"
echo "      已安装: $(ls "$SKILLS_SRC"/*.md | xargs -n1 basename | tr '\n' ' ')"

echo "[2/4] 安装 templates 到 $CLAUDE_TEMPLATES ..."
mkdir -p "$CLAUDE_TEMPLATES"
cp "$TEMPLATES_SRC"/*.md "$CLAUDE_TEMPLATES/"
echo "      已安装: $(ls "$TEMPLATES_SRC"/*.md | xargs -n1 basename | tr '\n' ' ')"

# 安装到 Codex
CODEX_SKILLS="$HOME/.codex/skills"
CODEX_TEMPLATES="$HOME/.codex/templates/req-system"

echo "[3/4] 安装 skills 到 $CODEX_SKILLS ..."
mkdir -p "$CODEX_SKILLS"
cp "$SKILLS_SRC"/*.md "$CODEX_SKILLS/"
echo "      已安装: $(ls "$SKILLS_SRC"/*.md | xargs -n1 basename | tr '\n' ' ')"

echo "[4/4] 安装 templates 到 $CODEX_TEMPLATES ..."
mkdir -p "$CODEX_TEMPLATES"
cp "$TEMPLATES_SRC"/*.md "$CODEX_TEMPLATES/"
echo "      已安装: $(ls "$TEMPLATES_SRC"/*.md | xargs -n1 basename | tr '\n' ' ')"

echo ""
echo "=== 安装完成 ==="
echo ""
echo "已安装的 skills:"
echo "  /req-clean      - 需求清洗与候选需求识别"
echo "  /req-confirm    - 客户确认话术生成"
echo "  /req-analyze    - 开发前置影响分析"
echo "  /req-accept     - 验收标准生成"
echo ""
echo "已安装的 templates (位于 templates/req-system/):"
echo "  project-facts.md      - 项目事实库模板"
echo "  candidate-backlog.md  - 候选需求池模板"
echo "  req-doc.md            - 单个需求文档模板"
echo ""
echo "使用方式:"
echo "  1. 收到客户需求 -> /req-clean"
echo "  2. 清洗结果确认 -> /req-confirm"
echo "  3. 客户确认后   -> /req-analyze"
echo "  4. 开发完成后   -> /req-accept"
echo ""
echo "新项目初始化时，让AI编程工具扫描项目后基于模板生成项目事实库:"
echo "  使用模板: $(echo "$CLAUDE_TEMPLATES/project-facts.md" | sed "s|$HOME|~|")"
