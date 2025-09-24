# LLM Provider Configuration Tool

An interactive shell script for configuring Claude Code to work with different language model providers (DeepSeek and Kimi-K2).

## Overview

This tool simplifies switching between different LLM providers by automatically configuring the necessary environment variables for Claude Code integration. Instead of manually setting multiple environment variables, you can use this interactive script to quickly switch between providers.

## Features

- 🔄 **Easy Provider Switching**: Quickly switch between DeepSeek and Kimi-K2
- 🔐 **Secure**: Uses your local environment variables for API keys
- ✅ **Validation**: Checks for required API keys before configuration
- 🛡️ **Safe**: Redacts sensitive information in output
- 📋 **Verification**: Built-in commands to verify configuration

## Prerequisites

You need to have API keys for at least one of the supported providers:

- **DeepSeek**: Get your API key from [DeepSeek Platform](https://platform.deepseek.com/)
- **Kimi-K2**: Get your API key from [Moonshot AI Platform](https://platform.moonshot.cn/)

## Installation

1. Clone or download this repository
2. Make the script executable:
   ```bash
   chmod +x llm.sh
   ```

## Usage

### Step 1: Set Your API Keys

Export your API keys as environment variables:

```bash
# For DeepSeek
export DEEPSEEK_API_KEY="your-actual-deepseek-api-key"

# For Kimi-K2
export KIMI_API_KEY="your-actual-kimi-api-key"
```

### Step 2: Source the Configuration Script

**Important**: You must source the script (not run it directly) for the environment variables to persist:

```bash
# Method 1: Using source
source ./llm.sh

# Method 2: Using dot notation
. ./llm.sh
```

### Step 3: Choose Your Provider

The script will prompt you to choose a provider:

```
Please choose your LLM provider:
1. DeepSeek
2. Kimi-K2
Enter your choice (1 or 2):
```

### Step 4: Verify Configuration

Check that the environment variables are set correctly:

```bash
env | grep ANTHROPIC
```

You should see output like:
```
ANTHROPIC_BASE_URL=https://api.deepseek.com/anthropic
ANTHROPIC_MODEL=deepseek-chat
ANTHROPIC_SMALL_FAST_MODEL=deepseek-chat
```

## Examples

### Example 1: Configure for DeepSeek

```bash
# Set your DeepSeek API key
export DEEPSEEK_API_KEY="sk-your-deepseek-key-here"

# Source the configuration script
source ./llm.sh

# Choose option 1 (DeepSeek)
# Verify the configuration
env | grep ANTHROPIC
```

### Example 2: Switch to Kimi-K2

```bash
# Set your Kimi API key
export KIMI_API_KEY="sk-your-kimi-key-here"

# Source the configuration script again
source ./llm.sh

# Choose option 2 (Kimi-K2)
# Verify the new configuration
env | grep ANTHROPIC
```

### Example 3: Make API Keys Persistent

Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):

```bash
# For DeepSeek
export DEEPSEEK_API_KEY="your-deepseek-key"

# For Kimi-K2
export KIMI_API_KEY="your-kimi-key"
```

Then reload your profile:
```bash
source ~/.bashrc  # or ~/.zshrc
```

## Error Handling

The script provides clear error messages and guidance:

### Missing API Key
```
Error: DEEPSEEK_API_KEY environment variable is not set!
Please set your DeepSeek API key: export DEEPSEEK_API_KEY='your-key-here'
Configuration failed.
```

### Wrong Execution Method
```
Error: This script must be sourced to work properly!
Usage: source ./llm.sh  OR  . ./llm.sh
```

## Troubleshooting

### Environment Variables Not Persisting

**Problem**: After running the script, `env | grep ANTHROPIC` shows nothing.

**Solution**: Make sure you're sourcing the script, not executing it:
```bash
# ❌ Wrong
./llm.sh

# ✅ Correct
source ./llm.sh
```

### API Key Not Found

**Problem**: Script says API key environment variable is not set.

**Solution**: Check that your API key is properly exported:
```bash
# Check if the variable exists
echo $DEEPSEEK_API_KEY
# or
echo $KIMI_API_KEY

# If empty, set it properly
export DEEPSEEK_API_KEY="your-actual-key"
```

### Configuration Not Working with Claude Code

**Problem**: Claude Code doesn't recognize the configured provider.

**Solution**:
1. Verify all environment variables are set: `env | grep ANTHROPIC`
2. Make sure you're in the same shell session where you sourced the script
3. Restart Claude Code if necessary

## Environment Variables

The script configures these Claude Code environment variables:

| Variable | Description | Example Value |
|----------|-------------|---------------|
| `ANTHROPIC_BASE_URL` | API endpoint URL | `https://api.deepseek.com/anthropic` |
| `ANTHROPIC_AUTH_TOKEN` | Authentication token | (your API key) |
| `ANTHROPIC_MODEL` | Main model identifier | `deepseek-chat` |
| `ANTHROPIC_SMALL_FAST_MODEL` | Fast model variant | `deepseek-chat` |

## Security Notes

- 🔐 API keys are never stored in the script or repository
- 🔒 Auth tokens are redacted in output for security
- 🛡️ Script validates API key presence before proceeding
- 🔓 Environment variables persist only in the current shell session

## Contributing

When contributing to this project:

1. Maintain the sourcing requirement for environment variable persistence
2. Keep API key validation and error handling robust
3. Ensure auth tokens are always redacted in output
4. Test both provider configurations thoroughly
5. Update documentation when adding new features

## License

This project is designed for personal use with Claude Code. Ensure you comply with the terms of service for your chosen LLM provider.