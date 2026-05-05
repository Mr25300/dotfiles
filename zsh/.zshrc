# PATH CONFIGURATION

setopt extended_glob null_glob


path=(
    $path
    $HOME/.local/bin # For user-level applications
    $HOME/dotfiles/scripts
)

# Remove duplicate and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# OTHER STUFF

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
PROMPT='[%n@%m %1~]%# '
