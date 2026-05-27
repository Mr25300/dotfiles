# All the environment variables for zsh

# SCRIPTS AND PATH

setopt extended_glob null_glob # Required for removing non-existent directories below

export SCRIPTS="$DOTFILES/scripts"

path=(
    $path
    $HOME/.local/bin # For user-level applications
    $SCRIPTS
)

typeset -U path # Clean duplicates
path=($^path(N-/)) # Remove non-existent directories

export PATH


# APPS

export VISUAL=nvim
export EDITOR=nvim

export TERM=kitty
export TERMINAL=kitty

export BROWSER=firefox


# USER DIRS

if [[ -f "$XDG_CONFIE_HOME/user-dirs.dirs" ]]; then
    source "$XDG_CONFIG_HOME/user-dirs.dirs"
fi

export SCREENSHOTS_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"
export RECORDINGS_DIR="${XDG_VIDEOS_DIR:-$HOME/Videos}/Recordings"


# SSH

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# export SSH_ASKPASS=/usr/bin/ksshaskpass
# export SSH_ASKPASS_REQUIRE=prefer


# XDG COMPLIANCE

export PYTHON_HISTORY="$XDG_STATE_HOME/python_history" # python
export GNUPGHOME="$XDG_DATA_HOME/gnupg" # gnupg
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet" # donet-sdk
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv" # CUDA
# "$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine" for manual
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc" # GTK 2 (may not work)
export PULSE_COOKIE="$XDG_CONFIG_HOME/pulse/cookie" # pipewire-pulse
