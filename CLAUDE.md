# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains AI/LLM configuration tools for switching between different language model providers (DeepSeek and Kimi-K2). The main component is an interactive shell script that configures environment variables for Claude Code integration.

## Current Structure

- `llm.sh` - Interactive script for configuring LLM provider settings
- `.claude/settings.local.json` - Claude Code configuration with specific permissions
- `CLAUDE.md` - This guidance file

## Development Commands

### Shell Scripts
- Make scripts executable: `chmod +x *.sh`
- Source scripts (required for environment variables): `source ./llm.sh` or `. ./llm.sh`
- **Important**: Scripts must be sourced, not executed directly, to persist environment variables

### LLM Configuration
1. Set API keys in your environment:
   ```bash
   export DEEPSEEK_API_KEY="your-deepseek-key"
   # or
   export KIMI_API_KEY="your-kimi-key"
   ```
2. Source the configuration script: `source ./llm.sh`
3. Choose your provider (1 for DeepSeek, 2 for Kimi-K2)
4. Verify with: `env | grep ANTHROPIC`

### Testing
- Verify environment variables: `env | grep ANTHROPIC`
- Test script sourcing: `source ./llm.sh` (should show provider selection)
- Check API key detection: Run without setting API keys to test error handling

## Architecture Notes

### Environment Variable Management
- The script uses `export` to set variables in the current shell session
- Must be sourced (not executed) to affect the parent shell environment
- API keys are validated before configuration proceeds
- Auth tokens are redacted in output for security

### Claude Code Integration
The script configures these Claude Code environment variables:
- `ANTHROPIC_BASE_URL` - API endpoint for the selected provider
- `ANTHROPIC_AUTH_TOKEN` - Authentication token from local environment
- `ANTHROPIC_MODEL` - Model identifier for the provider
- `ANTHROPIC_SMALL_FAST_MODEL` - Fast model variant

### Security Considerations
- API keys are never hardcoded in the script
- Auth tokens are redacted in output display
- Script validates API key presence before proceeding
- Environment variables persist only in current shell session

When developing here, consider:
- This is designed for Claude Code integration with multiple LLM providers
- Environment variable persistence is critical for proper functionality
- Error handling should guide users to proper setup procedures