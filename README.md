# Claude Code Model Switch

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![Platform](https://img.shields.io/badge/Platform-Linux-lightgrey.svg)](https://www.linux.org/)
[![Claude Code](https://img.shields.io/badge/Made%20with-Claude%20Code-ff69b4.svg)](https://claude.com/claude-code)

> 🎯 One-click switching tool for Claude Code model configurations

A Shell script that simplifies Claude Code model configuration management, supporting quick switching between multiple AI coding assistants like Kimi, GLM, and Doubao. Say goodbye to the tedious process of manually editing `.bashrc` files - enjoy the convenience of `proxy_on`/`proxy_off`-style commands.

**[中文文档](README.zh-CN.md) | English**

## ✨ Features

- 🚀 **One-click Model Switching** - Quick switching between multiple AI coding assistants
- 🔧 **Simplified Configuration Management** - No need to manually edit `.bashrc` files
- 🎨 **User-friendly CLI** - Colored output and clear status indicators
- 🔒 **Security & Reliability** - Automatic masking of API tokens, user permission control
- 📝 **Configuration Status Display** - Real-time view of current model configuration
- 🧹 **Smart Environment Cleanup** - Automatically clears previous configurations before switching

## 📖 Project Story

The birth of this project is quite interesting - **I used Claude Code to write this script that helps manage Claude Code configurations!**

Here's how it happened: I purchased coding APIs from multiple AI models (including Kimi, Zhipu GLM, Doubao, etc.), but switching between different models in Claude Code was extremely troublesome:

- Every time I had to manually modify the `~/.bashrc` file
- Needed to comment out current configuration and uncomment new configuration
- Had to reload the configuration file (`source ~/.bashrc`)
- It was error-prone and very inconvenient

So I thought: **Since I'm using Claude Code, why not let Claude Code help me write a tool to solve this problem?**

And thus this project was born - a tool that can quickly switch Claude Code model configurations through simple commands, as convenient as `proxy_on`/`proxy_off`!

## 🎯 Supported Configurations

| Configuration | Provider | Model | Description |
|---------------|----------|-------|-------------|
| **kimi** | Kimi | kimi-for-coding | Moonshot AI's Kimi Coding Assistant |
| **glm** | Zhipu AI | glm-4.6 / glm-4.5-air | Zhipu AI GLM Series |
| **doubao** | Doubao | doubao-seed-code-preview-latest | ByteDance Doubao Coding Assistant |

## 🚀 Quick Start

### 1. Clone Repository

```bash
git clone https://github.com/Wait021/claudecode-model-switch.git
cd claudecode-model-switch
```

### 2. ⚠️ Configure Your API Keys

Edit the `claude_switch.sh` file and replace the example tokens with your real API keys:

```bash
nano claude_switch.sh
```

Lines to modify:
- **Line 47**: Kimi configuration `ANTHROPIC_AUTH_TOKEN="sk-your-kimi-api-key"`
- **Line 62**: GLM configuration `ANTHROPIC_AUTH_TOKEN="your-glm-api-key"`
- **Line 77**: Doubao configuration `ANTHROPIC_AUTH_TOKEN="your-doubao-api-key"`

### 3. Add to .bashrc

```bash
echo "source $(pwd)/claude_switch.sh" >> ~/.bashrc
source ~/.bashrc
```

## 📖 Usage

### Basic Commands

```bash
# Switch configurations
claude_kimi      # Switch to Kimi configuration
claude_glm       # Switch to GLM configuration
claude_doubao    # Switch to Doubao configuration

# Management commands
claude_status    # View current configuration status
claude_clear     # Clear all Claude configurations
claude_help      # Show help information
```

### Usage Examples

```bash
# View current configuration
$ claude_status
[信息] Current Claude Code configuration status:
  BASE_URL: https://open.bigmodel.cn/api/anthropic
  AUTH_TOKEN: 034b4a1f143449c69e1e...
  MODEL: default

# Switch to Kimi configuration
$ claude_kimi
[×] Cleared all Claude Code configurations
[√] Switched to Kimi configuration
[信息] Current Claude Code configuration status:
  BASE_URL: https://api.kimi.com/coding/
  AUTH_TOKEN: sk-kimi-KmnjhHiawvER...
  MODEL: kimi-for-coding
```

## ⚙️ Configuration Details

Each configuration includes the following environment variables:

- `ANTHROPIC_BASE_URL`: Service endpoint URL
- `ANTHROPIC_AUTH_TOKEN`: API authentication token
- `ANTHROPIC_MODEL`: Default model
- `API_TIMEOUT_MS`: Request timeout (3000000ms = 50 minutes)
- `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`: Disable non-essential traffic

## 🔒 Security Notes

🚨 **Important Reminders**:

1. **⚠️ Configure Real API Keys**:
   - The `claude_switch.sh` in the project only contains example tokens (like `sk-your-kimi-api-key`, `your-glm-api-key`)
   - **Must** replace them with your valid API keys for normal usage

2. **🔒 Protect Sensitive Information**:
   - **Do not** commit files with real API keys to public repositories
   - Already excluded files containing real tokens in `.gitignore`
   - Do not share your API keys in public places

3. **🔄 Regular Key Updates**:
   - Recommend regular API key rotation for security
   - Immediately change and revoke old keys if compromise is detected

## 🔧 Custom Configuration

To add new configurations, edit the `claude_switch.sh` file and add new functions following the existing format:

```bash
function claude_your_provider() {
    claude_clear

    export ANTHROPIC_BASE_URL="https://your-provider.com/api"
    export ANTHROPIC_AUTH_TOKEN="your-token-here"
    export ANTHROPIC_MODEL="your-model-name"
    # Other configurations...

    echo -e "\033[32m[√] Switched to Your Provider configuration\033[0m"
    claude_status
}
```

## 🐛 Troubleshooting

### Common Issues

1. **Command Not Found**:
   - Ensure the script is added to `~/.bashrc`
   - Reload terminal or execute `source ~/.bashrc`

2. **Permission Denied**:
   - Script only allows `lrc` user by default
   - Edit the `ALLOWED_USERS` variable in the script if modification is needed

3. **Configuration Not Effective**:
   - Check if API token is valid
   - Confirm network connection is normal
   - Verify service endpoint URL correctness

### Debug Mode

For debugging, you can manually run the script:
```bash
bash claude_switch.sh status
bash claude_switch.sh kimi
```

## 🤝 Contributing

Issues and Pull Requests are welcome!

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📝 Changelog

### v1.0.0 (2025-12-02)
- ✨ Initial release
- 🎯 Support for Kimi, GLM, Doubao configurations
- 🔒 User permission control
- 🎨 Colored output support
- 📖 Complete documentation and usage instructions

---

**Made with ❤️ for Claude Code users**