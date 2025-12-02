# Claude Code Model Switch

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)](https://www.linux.org/)
[![Claude Code](https://img.shields.io/badge/Made%20with-Claude%20Code-ff69b4.svg)](https://claude.com/claude-code)

> 🎯 一键切换 Claude Code 多种模型配置的命令行工具

一个简化 Claude Code 模型配置管理的 Shell 脚本，支持快速切换 Kimi、GLM、Doubao 等多种 AI 编程助手。告别手动修改 `.bashrc` 的繁琐操作，像使用 `proxy_on`/`proxy_off` 一样简单便捷。

**[中文文档](README.zh-CN.md) | English**

## ✨ 主要功能

- 🚀 **一键切换模型配置** - 支持多种 AI 编程助手的快速切换
- 🔧 **简化配置管理** - 无需手动编辑 `.bashrc` 文件
- 🎨 **友好的命令行界面** - 彩色输出和清晰的状态提示
- 🔒 **安全可靠** - API token 敏感信息自动隐藏，支持用户权限控制
- 📝 **配置状态显示** - 实时查看当前使用的模型配置
- 🧹 **智能环境清理** - 切换前自动清理之前的配置环境

## 📖 项目故事

这个项目的诞生很有意思——**我是用 Claude Code 来写这个帮助管理 Claude Code 配置的脚本！**

事情是这样的：我购买了多个 AI 模型的 Coding API（包括 Kimi、智谱 GLM、豆包等），但在使用 Claude Code 时，想要切换不同模型的 API 非常麻烦：

- 每次都要手动修改 `~/.bashrc` 文件
- 需要注释掉当前的配置，取消注释新的配置
- 还要重新加载配置文件（`source ~/.bashrc`）
- 容易出错，而且很不方便

于是就想到：**既然我在用 Claude Code，为什么不直接让 Claude Code 帮我写一个工具来解决这个问题呢？**

于是就有了这个项目——一个可以通过简单命令快速切换 Claude Code 模型配置的工具，就像 `proxy_on`/`proxy_off` 一样方便！

## 🎯 支持的配置

| 配置 | 服务商 | 模型 | 套餐计划 | 说明 |
|------|--------|------|----------|------|
| **kimi** | Kimi | kimi-for-coding | Kimi For Coding 会员 | 月之暗面的 Kimi 编程助手 |
| **glm** | 智谱AI | glm-4.6 / glm-4.5-air | GLM Coding Plan | 智谱 AI GLM 系列 |
| **doubao** | 豆包 | doubao-seed-code-preview-latest | 方舟 Coding Plan | 字节跳动豆包编程助手 |

## 🎁 优惠推荐

🚀 **智谱 GLM Coding 超值订阅，邀你一起薅羊毛！**

Claude Code、Cline 等 10+ 大编程工具无缝支持，"码力"全开，越拼越爽！立即开拼，享限时惊喜价！

📱 **专属邀请链接**：https://www.bigmodel.cn/claude-code?ic=URM4OE8DBC

## 📊 服务商套餐详情

### 🌙 Kimi For Coding 会员
- **用量限制**：每 5 小时 100-500 次请求
- **响应速度**：最高输出速度可达 100 Tokens/秒
- **兼容工具**：Kimi CLI、Claude Code、RooCode 等
- **获取方式**：登录 Kimi → 左下角用户头像 → 会员计划

### 🤖 GLM Coding Plan
- **Lite 套餐**：¥20/月，每 5 小时约 120 次请求（相当于 Claude Pro 用量的 3 倍）
- **Pro 套餐**：¥50/月，每 5 小时约 600 次请求（相当于 Claude Max 5x 用量的 3 倍）
- **Max 套餐**：¥100/月，每 5 小时约 2400 次请求（相当于 Claude Max 20x 用量的 3 倍）
- **响应速度**：55+ Tokens/秒，真正实时交互
- **支持工具**：Claude Code、Cline、OpenCode、Roo Code 等 10+ 编程工具

### 🐋 方舟 Coding Plan（豆包）
- **Lite 套餐**：适合中等强度开发任务，每 5 小时最多约 1,200 次请求
- **Pro 套餐**：适合复杂项目开发，Lite 套餐的 5 倍用量，每 5 小时最多约 6,000 次请求
- **月限制**：Lite 套餐每月最多约 18,000 次请求，Pro 套餐每月最多约 90,000 次请求
- **刷新规则**：每 5 小时滑动窗口刷新，每周一重置周限额，每月第 1 日重置月限额
- **支持工具**：Claude Code、Cursor、Cline、Codex CLI、veCLI 等

## 安装方法

1. **克隆仓库**：
   ```bash
   git clone https://github.com/Wait021/claudecode-model-switch.git
   cd claudecode-model-switch
   ```

2. **⚠️ 配置你的 API Keys**：

   编辑 `claude_switch.sh` 文件，将示例 token 替换为你的真实 API keys：
   ```bash
   nano claude_switch.sh
   ```

   需要修改的位置：
   - **第47行**：Kimi 配置的 `ANTHROPIC_AUTH_TOKEN="sk-your-kimi-api-key"`
   - **第62行**：GLM 配置的 `ANTHROPIC_AUTH_TOKEN="your-glm-api-key"`
   - **第77行**：Doubao 配置的 `ANTHROPIC_AUTH_TOKEN="your-doubao-api-key"`

3. **添加到 .bashrc**：
   ```bash
   echo "source $(pwd)/claude_switch.sh" >> ~/.bashrc
   source ~/.bashrc
   ```

## 使用方法

### 基本命令

```bash
# 切换配置
claude_kimi      # 切换到 Kimi 配置
claude_glm       # 切换到 GLM 配置
claude_doubao    # 切换到 Doubao 配置

# 管理命令
claude_status    # 查看当前配置状态
claude_clear     # 清除所有 Claude 配置
claude_help      # 显示帮助信息
```

### 使用示例

```bash
# 查看当前配置
$ claude_status
[信息] 当前 Claude Code 配置状态：
  BASE_URL: https://open.bigmodel.cn/api/anthropic
  AUTH_TOKEN: 034b4a1f143449c69e1e...
  MODEL: 默认

# 切换到 Kimi 配置
$ claude_kimi
[×] 已清除所有 Claude Code 配置
[√] 已切换到 Kimi 配置
[信息] 当前 Claude Code 配置状态：
  BASE_URL: https://api.kimi.com/coding/
  AUTH_TOKEN: sk-kimi-KmnjhHiawvER...
  MODEL: kimi-for-coding
```

## 配置说明

每个配置包含以下环境变量：

- `ANTHROPIC_BASE_URL`：服务端点 URL
- `ANTHROPIC_AUTH_TOKEN`：API 认证令牌
- `ANTHROPIC_MODEL`：默认模型
- `API_TIMEOUT_MS`：请求超时时间
- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`：禁用非必要流量

## 安全注意事项

🚨 **重要提醒**：

1. **⚠️ 配置真实 API Keys**：
   - 项目中的 `claude_switch.sh` 只包含示例 token（如 `sk-your-kimi-api-key`、`your-glm-api-key`）
   - **必须**将它们替换为你自己的有效 API keys 才能正常使用

2. **🔒 保护敏感信息**：
   - **不要**将包含真实 API keys 的文件提交到公开仓库
   - 已经在 `.gitignore` 中排除包含真实 token 的文件
   - 不要在公开场合分享你的 API 密钥

3. **🔄 定期更新密钥**：
   - 建议定期更换 API 密钥以确保安全
   - 如果发现密钥泄露，立即更换并撤销旧密钥

## 自定义配置

如需添加新的配置，可以编辑 `claude_switch.sh` 文件，按照现有格式添加新的函数：

```bash
function claude_your_provider() {
    claude_clear

    export ANTHROPIC_BASE_URL="https://your-provider.com/api"
    export ANTHROPIC_AUTH_TOKEN="your-token-here"
    export ANTHROPIC_MODEL="your-model-name"
    # 其他配置...

    echo -e "\033[32m[√] 已切换到 Your Provider 配置\033[0m"
    claude_status
}
```

## 故障排除

### 常见问题

1. **命令未找到**：
   - 确保已将脚本添加到 `~/.bashrc`
   - 重新加载终端或执行 `source ~/.bashrc`

2. **权限不足**：
   - 脚本默认仅允许 `lrc` 用户使用
   - 如需修改，编辑脚本中的 `ALLOWED_USERS` 变量

3. **配置不生效**：
   - 检查 API token 是否有效
   - 确认网络连接正常
   - 验证服务端点 URL 正确性

### 调试模式

如需调试，可以手动运行脚本：
```bash
bash claude_switch.sh status
bash claude_switch.sh kimi
```

## 贡献指南

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的修改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

## 更新日志

### v1.0.0 (2025-12-02)
- ✨ 初始版本发布
- 🎯 支持 Kimi、GLM、Doubao 三种配置
- 🔒 添加用户权限控制
- 🎨 彩色输出支持
- 📖 完整的文档和使用说明

---

**Made with ❤️ for Claude Code users**