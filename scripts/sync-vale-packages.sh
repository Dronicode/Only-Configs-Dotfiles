#!/usr/bin/env bash
set -e

VALE_CONFIG_PATH="${1:-$HOME/.config/nvim/tools/vale/.vale.ini}"

get_vale_bin() {
    if command -v vale >/dev/null 2>&1; then
        command -v vale
        return 0
    fi

    if [ -x "$HOME/.local/share/nvim/mason/bin/vale" ]; then
        printf '%s\n' "$HOME/.local/share/nvim/mason/bin/vale"
        return 0
    fi

    return 1
}

main() {
    local vale_bin

    if [ ! -f "$VALE_CONFIG_PATH" ]; then
        echo "! Vale config not found at $VALE_CONFIG_PATH; skipping package sync"
        return 0
    fi

    if ! vale_bin="$(get_vale_bin)"; then
        echo "! Vale binary not found; skipping package sync"
        return 0
    fi

    echo "Syncing Vale packages using $VALE_CONFIG_PATH..."
    "$vale_bin" sync --config "$VALE_CONFIG_PATH"
}

main "$@"