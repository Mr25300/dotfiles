# This file must be linked to ~/.zshenv and the rest do not

# XDG directories

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

# dotfiles and zsh

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_STATE_DIR="$XDG_STATE_HOME/zsh"

if [[ -f "$ZDOTDIR/env.zsh" ]]; then
    source "$ZDOTDIR/env.zsh"
fi

if [[ ! -d "$ZSH_STATE_DIR" ]]; then
    mkdir -p "$ZSH_STATE_DIR"
fi
