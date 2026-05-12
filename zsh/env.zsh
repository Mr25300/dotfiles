# APPS

export VISUAL=nvim
export EDITOR=nvim

export TERM=kitty
export TERMINAL=kitty

export BROWSER=firefox


# SCRIPTS

export SCRIPTS="$DOTFILES/scripts"


# SSH

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# export SSH_ASKPASS=/usr/bin/ksshaskpass
# export SSH_ASKPASS_REQUIRE=prefer


# XDG COMPLIANCE

# python

export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"


# gnupg

GPG_DIR="$XDG_DATA_HOME/gnupg"
[ ! -d "$GPG_DIR" ] && mkdir -p -m 700 "$GPG_DIR"

export GNUPGHOME="$GPG_DIR"

# dotnet-sdk

export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet" # May not work, remove if it doesn't

# CUDA

CUDA_DIR="$XDG_CACHE_HOME/nv"
[ ! -d "$CUDA_DIR" ] && mkdir -p "$CUDA_DIR"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# GTK 2

# "$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine" for manual
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc" # May not work

# nvidia-settings

# nvidia-settings --config="$XDG_CONFIG_HOME/nvidia/settings"

# PulseAudio (pipewire-pulse)
