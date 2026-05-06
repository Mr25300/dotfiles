# This file must be linked to ~/.zshenv and the rest do not

# XDG directories

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_RUNTIME_DIR="/run/user/$UID"

# dotfiles directory

export DOTFILES="$HOME/dotfiles"

# zsh dotfiles and sourcing

export ZDOTDIR="$DOTFILES/zsh"

if [[ -f "$ZDOTDIR/env.zsh" ]]; then
    source "$ZDOTDIR/env.zsh"
fi
