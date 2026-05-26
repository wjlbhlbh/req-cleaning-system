# 需求清洗系统 - 安装脚本 (Windows PowerShell)
# 每个 skill 是一个目录，目录内包含 SKILL.md 文件
# 将 skills 安装到 ~/.claude/skills/ 和 ~/.codex/skills/
# 将 templates 安装到 ~/.claude/templates/req-system/ 和 ~/.codex/templates/req-system/

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSrc = Join-Path $ScriptDir "skills"
$TemplatesSrc = Join-Path $ScriptDir "templates"

Write-Host "=== 需求清洗系统 安装脚本 ===" -ForegroundColor Cyan
Write-Host ""

# 安装到 Claude Code
$ClaudeSkills = Join-Path $HOME ".claude\skills"
$ClaudeTemplates = Join-Path $HOME ".claude\templates\req-system"

Write-Host "[1/4] 安装 skills 到 $ClaudeSkills ..." -ForegroundColor Yellow
Get-ChildItem -Directory "$SkillsSrc" | ForEach-Object {
    $targetDir = Join-Path $ClaudeSkills $_.Name
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Copy-Item "$($_.FullName)\*" -Destination $targetDir -Force
    Write-Host "      已安装: $($_.Name)/"
}

Write-Host "[2/4] 安装 templates 到 $ClaudeTemplates ..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $ClaudeTemplates | Out-Null
Copy-Item "$TemplatesSrc\*.md" -Destination $ClaudeTemplates -Force
Get-ChildItem "$TemplatesSrc\*.md" | ForEach-Object { Write-Host "      已安装: $($_.Name)" }

# 安装到 Codex
$CodexSkills = Join-Path $HOME ".codex\skills"
$CodexTemplates = Join-Path $HOME ".codex\templates\req-system"

Write-Host "[3/4] 安装 skills 到 $CodexSkills ..." -ForegroundColor Yellow
Get-ChildItem -Directory "$SkillsSrc" | ForEach-Object {
    $targetDir = Join-Path $CodexSkills $_.Name
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Copy-Item "$($_.FullName)\*" -Destination $targetDir -Force
    Write-Host "      已安装: $($_.Name)/"
}

Write-Host "[4/4] 安装 templates 到 $CodexTemplates ..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path $CodexTemplates | Out-Null
Copy-Item "$TemplatesSrc\*.md" -Destination $CodexTemplates -Force
Get-ChildItem "$TemplatesSrc\*.md" | ForEach-Object { Write-Host "      已安装: $($_.Name)" }

Write-Host ""
Write-Host "=== 安装完成 ===" -ForegroundColor Green
Write-Host ""
Write-Host "已安装的 skills (目录格式: skills/<name>/SKILL.md):" -ForegroundColor Cyan
Write-Host "  /req-clean      - 需求清洗与候选需求识别"
Write-Host "  /req-confirm    - 客户确认话术生成"
Write-Host "  /req-analyze    - 开发前置影响分析"
Write-Host "  /req-accept     - 验收标准生成"
Write-Host ""
Write-Host "已安装的 templates (位于 templates/req-system/):" -ForegroundColor Cyan
Write-Host "  project-facts.md      - 项目事实库模板"
Write-Host "  candidate-backlog.md  - 候选需求池模板"
Write-Host "  req-doc.md            - 单个需求文档模板"
Write-Host ""
Write-Host "使用方式:" -ForegroundColor Cyan
Write-Host "  1. 收到客户需求 -> /req-clean"
Write-Host "  2. 清洗结果确认 -> /req-confirm"
Write-Host "  3. 客户确认后   -> /req-analyze"
Write-Host "  4. 开发完成后   -> /req-accept"
Write-Host ""
Write-Host "新项目初始化时，让AI编程工具扫描项目后基于模板生成项目事实库。" -ForegroundColor Cyan
