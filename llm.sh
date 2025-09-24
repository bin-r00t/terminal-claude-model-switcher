#!/bin/bash

# Check if script is being sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "Error: This script must be sourced to work properly!"
    echo "Usage: source $0  OR  . $0"
    exit 1
fi

echo "Please choose your LLM provider:"
echo "1. DeepSeek"
echo "2. Kimi-K2"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        echo "Configuring for DeepSeek..."
        if [ -z "$DEEPSEEK_API_KEY" ]; then
            echo "Error: DEEPSEEK_API_KEY environment variable is not set!"
            echo "Please set your DeepSeek API key: export DEEPSEEK_API_KEY='your-key-here'"
            echo "Configuration failed."
            return 1
        fi
        export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
        export ANTHROPIC_AUTH_TOKEN="$DEEPSEEK_API_KEY"
        export ANTHROPIC_MODEL="deepseek-chat"
        export ANTHROPIC_SMALL_FAST_MODEL="deepseek-chat"
        echo "DeepSeek configuration set successfully!"
        echo "ANTHROPIC_BASE_URL=$ANTHROPIC_BASE_URL"
        echo "ANTHROPIC_MODEL=$ANTHROPIC_MODEL"
        echo "ANTHROPIC_AUTH_TOKEN=[REDACTED]"
        ;;
    2)
        echo "Configuring for Kimi-K2..."
        if [ -z "$KIMI_API_KEY" ]; then
            echo "Error: KIMI_API_KEY environment variable is not set!"
            echo "Please set your Kimi API key: export KIMI_API_KEY='your-key-here'"
            echo "Configuration failed."
            return 1
        fi
        export ANTHROPIC_BASE_URL="https://api.moonshot.cn/anthropic"
        export ANTHROPIC_AUTH_TOKEN="$KIMI_API_KEY"
        export ANTHROPIC_MODEL="kimi-k2-turbo-preview"
        export ANTHROPIC_SMALL_FAST_MODEL="kimi-k2-turbo-preview"
        echo "Kimi-K2 configuration set successfully!"
        echo "ANTHROPIC_BASE_URL=$ANTHROPIC_BASE_URL"
        echo "ANTHROPIC_MODEL=$ANTHROPIC_MODEL"
        echo "ANTHROPIC_AUTH_TOKEN=[REDACTED]"
        ;;
    *)
        echo "Invalid choice. Please run the script again and choose 1 or 2."
        return 1
        ;;
esac

echo ""
echo "Environment variables have been set for this shell session."
echo "To verify, run: env | grep ANTHROPIC"
