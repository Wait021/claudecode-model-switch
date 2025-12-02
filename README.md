# Claude Code Model Switch

一键切换 Claude Code 多种配置环境，支持 Kimi、GLM、Doubao 等多种配置。

## 功能特点

- 🚀 **快速切换**：一键切换不同的 Claude Code 配置
- 🔒 **权限控制**：仅限指定用户使用
- 🎨 **彩色输出**：清晰的状态显示和错误提示
- 🔐 **安全隐藏**：API token 敏感信息自动隐藏
- 🧹 **自动清理**：切换配置前自动清理之前的设置

## 支持的配置

| 配置 | 服务商 | 模型 | 说明 |
|------|--------|------|------|
| **kimi** | Kimi | kimi-for-coding | 月之暗面的 Kimi 编程助手 |
| **glm** | 智谱AI | glm-4.6 / glm-4.5-air | 智谱 AI GLM 系列 |
| **doubao** | 豆包 | doubao-seed-code-preview-latest | 字节跳动豆包编程助手 |

## 安装方法

1. **克隆仓库**：
   ```bash
   git clone https://github.com/your-username/claudecode-model-switch.git
   cd claudecode-model-switch
   ```

2. **添加到 .bashrc**：
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

⚠️ **重要提醒**：

1. **不要提交敏感信息**：本项目的配置文件中包含示例 token，请替换为你自己的有效 token
2. **保护 API 密钥**：不要在公开场合分享你的 API 密钥
3. **定期更新密钥**：建议定期更换 API 密钥以确保安全

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

### v1.0.0 (2024-12-02)
- ✨ 初始版本发布
- 🎯 支持 Kimi、GLM、Doubao 三种配置
- 🔒 添加用户权限控制
- 🎨 彩色输出支持
- 📖 完整的文档和使用说明

---

**Made with ❤️ for Claude Code users**