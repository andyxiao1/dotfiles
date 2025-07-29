# ================================================================================
# ============================== Install / Sources ===============================
# ================================================================================
# INSTALL: [zsh] https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
#          - this is usually installed by default
# INSTALL: [oh-my-zsh] https://github.com/ohmyzsh/ohmyzsh
# INSTALL: [fzf] https://github.com/junegunn/fzf
# INSTALL: [lf] https://github.com/gokcehan/lf
# INSTALL: [rg] https://github.com/BurntSushi/ripgrep

# ================================================================================
# ================================ TODOs / Notes =================================
# ================================================================================
# TODO: install htop
# TODO: get better shell auto-completions / faster
# TODO: get intellisense like auto-suggestions in the shell; with tabbing
# TODO: figure out how to specific things ignored/deleted from zsh history
# TODO: get a good diff/dwdiff workflow
# TODO: download csvlook
# TODO: field script/function thing

# REMEMBER: bc = basic calculator to do simple math

# ================================================================================
# ================================== Settings ====================================
# ================================================================================

# =============================== oh-my-zsh Stuff ================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh uses this env var internally
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
)

# Loads the main oh-my-zsh script which sets up themes, enables plugins, etc
# n.b. themes/plugins should be set BEFORE this step
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================== fzf Stuff ================================
# - REMEMBER: [fzf] ctrl+r to search cmd history
# - REMEMBER: [fzf] ctrl+f to search files
# - REMEMBER: [fzf] esc+c to open up directory switcher
# - REMEMBER: [fzf] ctrl prefix for vim motions!
# - REMEMBER: [fzf] ** trigger for fuzzy completion; kill ** or ls **
# - REMEMBER: [fzf] you can pipe fzf in things & it can be an intermediary step like `rg --hidden 'REMEMBER: ' | fzf | awk '{print $0}'` or `vim `fzf``
# - TODO: [fzf] ** trigger sometimes doesn't work
# - TODO: [fzf] better ignore files (hidden? .git?)
# - LEARN: [fzf] multi-select mode

# Sets up fzf keybindings, shell functions, auto-completion, etc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# I prefer --style=full better
export FZF_DEFAULT_OPTS="--height=70% --preview=\"cat {}\" --preview-window=right:60%:wrap --style=full"
# The command to use when running fzf:
# - rg: ripgrep, faster
# - --files: list all files to be searched (file names only, no content)
# - --hidden: include hidden files and directories (those starting with a dot)
# - --follow: follow symbolic links to files/directories
# - --glob "!.git/*": exclude all files inside any .git directory
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# For historical reasons I'm used to ctrl + f as the fzf file finder
# TODO: [fzf] this ctrl + f thing isn't working; I think because of my bindkey -v later on
bindkey '^F' fzf-file-widget

# ================================= Misc Things ==================================
# Full screen editor
export VISUAL=nvim
# Fallback / general editor
export EDITOR="$VISUAL"

# n.b. uv adds this
# Safely adds $HOME/.local/bin to the $PATH
. "$HOME/.local/bin/env"

# Vi keybindings in zsh shell
# n.b. this has to be after all the source-ing that happens above, because
# something there overrides bindkey
# TODO: [bindkey -v] decide if I actually want this, some weird stuff happens fzf
bindkey -v

# ================================================================================
# =================================== Aliases ====================================
# ================================================================================

# Dev config aliases
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias dotfiles="cd ~/.dotfiles"

# Tooling aliases
alias vim="nvim"
alias trunc="cut -c -250"
alias ssum="awk '{total+=\$}END{printf\"%f\n\",total}'"
alias splitlines="tr ' ' '\n'"

# ================================================================================
# ================================== Functions ===================================
# ================================================================================

