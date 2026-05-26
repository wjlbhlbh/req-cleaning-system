#!/usr/bin/env bash
# 需求清洗系统 - 安装脚本 v2.0
# 统一 skill 格式: skills/<name>/SKILL.md + templates/
# 安装到 ~/.claude/skills/ 和 ~/.codex/skills/

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"
TEMPLATES_SRC="$SCRIPT_DIR/templates"

echo "=== 需求清洗系统 v2.0 安装脚本 ==="
echo ""

# 安装到 Claude Code
CLAUDE_SKILLS="$HOME/.claude/skills"
CLAUDE_TEMPLATES="$HOME/.claude/templates/req-system"

echo "[1/4] 安装 skills 到 $CLAUDE_SKILLS ..."
for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name=$(basename "$skill_dir")
    target_dir="$CLAUDE_SKILLS/$skill_name"
    mkdir -p "$target_dir"
    cp -r "$skill_dir"* "$target_dir/" 2>/dev/null || true
    echo "      已安装: $skill_name/"
done

echo "[2/4] 安装 project templates 到 $CLAUDE_TEMPLATES ..."
mkdir -p "$CLAUDE_TEMPLATES"
cp "$TEMPLATES_SRC"/*.md "$CLAUDE_TEMPLATES/" 2>/dev/null || true
for tmpl in "$TEMPLATES_SRC"/*.md; do
    echo "      已安装: $(basename "$tmpl")"
done

# 安装到 Codex
CODEX_SKILLS="$HOME/.codex/skills"
CODEX_TEMPLATES="$HOME/.codex/templates/req-system"

echo "[3/4] 安装 skills 到 $CODEX_SKILLS ..."
for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name=$(basename "$skill_dir")
    target_dir="$CODEX_SKILLS/$skill_name"
    mkdir -p "$target_dir"
    cp -r "$skill_dir"* "$target_dir/" 2>/dev/null || true
    echo "      已安装: $skill_name/"
done

echo "[4/4] 安装 project templates 到 $CODEX_TEMPLATES ..."
mkdir -p "$CODEX_TEMPLATES"
cp "$TEMPLATES_SRC"/*.md "$CODEX_TEMPLATES/" 2>/dev/null || true
for tmpl in "$TEMPLATES_SRC"/*.md; do
    echo "      已安装: $(basename "$tmpl")"
done

echo ""
echo "=== 安装完成 ==="
echo ""
echo "已安装 skill:"
echo "  /req-system   - 需求清洗与管理系统（统一入口）"
echo ""
echo "触发关键词: 需求清洗、需求整理、需求分析、客户需求、甲方需求、"
echo "            原始需求、AI需求、候选需求、影响分析、验收标准 等"
echo ""
echo "使用方式:"
echo "  粘贴客户需求内容 → 自动触发需求清洗"
echo "  \"生成确认话术\" → 客户确认话术"
echo "  \"分析影响\"     → 开发前置影响分析"
echo "  \"验收标准\"     → 验收标准生成"
echo "  \"初始化项目事实\" → 扫描代码生成项目事实库"
echo ""
echo "已安装 project templates (位于 templates/req-system/):"
echo "  project-facts.md      - 项目事实库模板"
echo "  candidate-backlog.md  - 候选需求池模板"
echo "  req-doc.md            - 单个需求文档模板"
