#!/bin/bash

# Claude Code 配置切换脚本
# 支持 kimi, glm, doubao 三种配置

# 检查用户权限（仅限 lrc 用户）
CURRENT_USER="$(whoami)"
ALLOWED_USERS="lrc"

if [[ ! " $ALLOWED_USERS " =~ " $CURRENT_USER " ]]; then
    echo -e "\033[31m[×] 权限不足：仅限 lrc 用户使用\033[0m"
    return 1
fi

# 显示当前 Claude 配置状态
function claude_status() {
    echo -e "\033[34m[信息] 当前 Claude Code 配置状态：\033[0m"

    if [ -n "$ANTHROPIC_BASE_URL" ]; then
        echo "  BASE_URL: $ANTHROPIC_BASE_URL"
        echo "  AUTH_TOKEN: ${ANTHROPIC_AUTH_TOKEN:0:20}..."
        echo "  MODEL: ${ANTHROPIC_MODEL:-默认}"
    else
        echo "  \033[33m[!] 未配置 Claude Code\033[0m"
    fi
}

# 清除所有 Claude 相关环境变量
function claude_clear() {
    unset ANTHROPIC_BASE_URL
    unset ANTHROPIC_AUTH_TOKEN
    unset ANTHROPIC_MODEL
    unset ANTHROPIC_SMALL_FAST_MODEL
    unset ANTHROPIC_DEFAULT_HAIKU_MODEL
    unset ANTHROPIC_DEFAULT_SONNET_MODEL
    unset ANTHROPIC_DEFAULT_OPUS_MODEL
    unset API_TIMEOUT_MS
    unset CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC
    echo -e "\033[31m[×] 已清除所有 Claude Code 配置\033[0m"
}

# Kimi 配置
function claude_kimi() {
    claude_clear

    export ANTHROPIC_BASE_URL="https://api.kimi.com/coding/"
    export ANTHROPIC_AUTH_TOKEN="sk-your-kimi-api-key"
    export ANTHROPIC_MODEL="kimi-for-coding"
    export ANTHROPIC_SMALL_FAST_MODEL="kimi-for-coding"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
    export API_TIMEOUT_MS="3000000"

    echo -e "\033[32m[√] 已切换到 Kimi 配置\033[0m"
    claude_status
}

# GLM 配置
function claude_glm() {
    claude_clear

    export ANTHROPIC_BASE_URL="https://open.bigmodel.cn/api/anthropic"
    export ANTHROPIC_AUTH_TOKEN="your-glm-api-key"
    export API_TIMEOUT_MS="3000000"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
    export ANTHROPIC_DEFAULT_HAIKU_MODEL="glm-4.5-air"
    export ANTHROPIC_DEFAULT_SONNET_MODEL="glm-4.6"
    export ANTHROPIC_DEFAULT_OPUS_MODEL="glm-4.6"

    echo -e "\033[32m[√] 已切换到 GLM 配置\033[0m"
    claude_status
}

# Doubao 配置
function claude_doubao() {
    claude_clear

    export ANTHROPIC_AUTH_TOKEN="your-doubao-api-key"
    export ANTHROPIC_BASE_URL="https://ark.cn-beijing.volces.com/api/coding"
    export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
    export API_TIMEOUT_MS="3000000"
    export ANTHROPIC_MODEL="doubao-seed-code-preview-latest"

    echo -e "\033[32m[√] 已切换到 Doubao 配置\033[0m"
    claude_status
}

# 显示帮助信息
function claude_help() {
    echo -e "\033[34m[信息] Claude Code 配置切换命令：\033[0m"
    echo "  claude_kimi    - 切换到 Kimi 配置"
    echo "  claude_glm     - 切换到 GLM 配置"
    echo "  claude_doubao  - 切换到 Doubao 配置"
    echo "  claude_clear   - 清除所有配置"
    echo "  claude_status  - 显示当前配置状态"
    echo "  claude_help    - 显示帮助信息"
}

# 主函数 - 根据参数执行对应操作
case "${1:-help}" in
    "kimi")
        claude_kimi
        ;;
    "glm")
        claude_glm
        ;;
    "doubao")
        claude_doubao
        ;;
    "clear")
        claude_clear
        ;;
    "status")
        claude_status
        ;;
    "help"|*)
        claude_help
        ;;
esac