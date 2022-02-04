# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/nix-zsh-completions/nix-zsh-completions.plugin.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh

fpath=( ~/.zsh/zsh-completions/src $fpath)
fpath=(~/.zsh/nix-zsh-completions $fpath)
fpath=(~/.zsh/myfunctions $fpath)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
bindkey '^ ' forward-word
bindkey '^[[3~' delete-char
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

export FZF_DEFAULT_OPTS="--reverse --border=none --height=70%"
export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules


# Preserve history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

autoload -Uz compinit && compinit
autoload -Uz cx
zstyle ':completion:*' menu select

alias lx=exa
alias ll="exa -l"
alias lla="exa -la" 
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval $(thefuck --alias)
