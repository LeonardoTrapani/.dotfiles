# -----------------------------
# Aliases
# -----------------------------
alias v="nvim"
alias vim="nvim"
alias g="git"
alias npm="pnpm"
alias ls="ls --color"
alias tls="tmuxp load"
alias cd="z"

export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

unset MAILCHECK

# -----------------------------
# PNPM
# -----------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# -----------------------------
# Starship prompt
# -----------------------------
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# -----------------------------
# Tmuxp
# -----------------------------
export TMUXP_CONFIGDIR="$HOME/.config/tmux/layouts"

# -----------------------------
# Plugins (syntax highlighting, autosuggestions, you-should-use)
# Installed via pacman/yay to /usr/share
# -----------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

# -----------------------------
# Zsh completions
# -----------------------------
autoload -Uz compinit
compinit

# -----------------------------
# History options
# -----------------------------
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="$HOME/.zsh_history"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# -----------------------------
# Completion styling
# -----------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-j}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

# -----------------------------
# Keybindings
# -----------------------------
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# -----------------------------
# Tools (fzf, zoxide)
# -----------------------------
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# -----------------------------
# Node/NVM (optional if used)
# -----------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# -----------------------------
# pipx PATH (if used)
# -----------------------------
export PATH="$HOME/.local/bin:$PATH"

