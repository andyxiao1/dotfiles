# ================================================================================
# ============================== Install / Sources ===============================
# ================================================================================
# INSTALL: [zsh] https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
#          - this is usually installed by default
# INSTALL: [oh-my-zsh] https://github.com/ohmyzsh/ohmyzsh
# INSTALL: [fzf] https://github.com/junegunn/fzf
# INSTALL: [lf] https://github.com/gokcehan/lf
# INSTALL: [rg] https://github.com/BurntSushi/ripgrep
# INSTALL: [nvim] https://github.com/neovim/neovim
# INSTALL: [tree] https://formulae.brew.sh/formula/tree
# INSTALL: [htop] https://formulae.brew.sh/formula/htop

# ================================================================================
# ================================ TODOs / Notes =================================
# ================================================================================
# TODO: get better shell auto-completions / faster
# TODO: get intellisense like auto-suggestions in the shell; with tabbing
# TODO: figure out how to specific things ignored/deleted from zsh history
# TODO: get a good diff/dwdiff workflow
# TODO: download csvlook/csvcut (csvkit) & csvgui
# TODO: field script/function thing

# REMEMBER: bc = basic calculator to do simple math
# REMEMBER: we are trying to get better with emacs shell bindings; `bindkey -L | less` is useful to figure out the mappings

# ================================================================================
# ================================== Settings ====================================
# ================================================================================

# =============================== General Things =================================
# Full screen editor
export VISUAL=nvim
# Fallback / general editor
export EDITOR="$VISUAL"
# Set XDG_CONFIG_HOME so it can be used downstream
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

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

# Powerlevel10k config
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "$XDG_CONFIG_HOME/zsh/p10k.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/p10k.zsh"

# =============================== fzf Stuff ================================
# - REMEMBER: [fzf] ctrl+r to search cmd history
# - REMEMBER: [fzf] ctrl+t to search files
# - REMEMBER: [fzf] esc+c to open up directory switcher
# - REMEMBER: [fzf] ctrl prefix for vim motions!
# - REMEMBER: [fzf] ** trigger for fuzzy completion; kill ** or ls **
# - REMEMBER: [fzf] you can pipe fzf in things & it can be an intermediary step like `rg --hidden 'REMEMBER: ' | fzf | awk '{print $0}'` or `vim `fzf``
# - REMEMBER: [fzf] in file searcher, tab / shift + tab to multiselect files

# Sets up fzf keybindings, shell functions, auto-completion, etc
[[ -f "$XDG_CONFIG_HOME/zsh/fzf.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/fzf.zsh"

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

# ============================== Post-Source Things ==============================
# n.b. uv adds this
# Safely adds $HOME/.local/bin to the $PATH
. "$HOME/.local/bin/env"

# Vi keybindings in zsh shell
# n.b. this has to be after all the source-ing that happens above, because
# something there overrides bindkey
# TODO: [bindkey -v] decide if I actually want this on, some weird stuff happens fzf ctrl+F & ** tab completion
# bindkey -v

# ================================================================================
# =================================== Aliases ====================================
# ================================================================================

# Dev config aliases
alias zshconfig="nvim ~/.zshrc"
alias gitconfig="nvim ~/.config/git/config"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias dotfiles="cd ~/.dotfiles"

# Tooling aliases
alias vim="nvim"
# Truncate output to 250 chars
alias trunc="cut -c -250"
# Sum the first column of input numbers
alias ssum="awk '{total+=\$1} END {printf \"%f\n\", total}'"
# Split space-separated words into separate lines
alias splitlines="tr ' ' '\n'"
# Load new history lines (from other terminals)
alias hist='history -n'

# ================================================================================
# ================================== Functions ===================================
# ================================================================================

