# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# TODO: do we need this?
bindkey -v

# If you come from bash you might have to change your $PATH.
# TODO: do we need this?
export PATH=$PATH:/Applications/CMake.app/Contents/bin
# export PATH=/usr/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=/usr/bin:$PATH
# export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME=random
ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME_RANDOM_CANDIDATES=(
    "robbyrussell"
    "agnoster"
    "powerlevel10k/powerlevel10k"
)

plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# aliases.
alias zshconfig="code ~/.zshrc"
alias vim="nvim"

# fzf setup.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height=70% --preview=\"cat {}\" --preview-window=right:60%:wrap"
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
