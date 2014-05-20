# 神 https://gist.github.com/teshi04/6132532

alias l='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias ls="ls --color"
alias vim='nano'

#key
bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[3~" delete-char
 
# rbenv
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
#unset RUBYOPT
 
export LSCOLORS=exfxcxdxbxegedabagacad

export PATH=$PATH:/opt/android-studio/bin:/opt/android-studio/sdk/platform-tools
export JAVA_HOME=/opt/oracle-jdk-bin-1.7.0.51

#日本語
export LANG=ja_JP.UTF-8
 
# 補完機能
autoload -U compinit
compinit -u
 
# 移動したディレクトリを記録･･･cd-[Tab]で移動履歴一覧
setopt auto_pushd
 
# コマンド訂正
setopt correct
 
#補完候補を詰めて表示
setopt list_packed
 
# lsの配色と補完候補の配色を合わせる
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=32' 'bd=46;34' 'cd=43;34'
 
# 大文字小文字の区別をせずに補完
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# tab補完で選択できるようにする
zstyle ':completion:*:default' menu select
 
# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export 
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
         'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac
 
# プロンプトの設定
autoload colors
colors
case ${UID} in
0)
  PROMPT="[%{${fg[green]}%}%n@%m%{${reset_color}%}] 
%{${fg[green]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[green]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? 
[n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
  ;;
*)
  PROMPT="[%n@%m] %{${fg[green]}%}#%{${reset_color}%} "
  PROMPT2="%B%{${fg[green]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[blue]}%}%r is correct? 
[n,y,a,e]:%{${reset_color}%}%b "
  RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
 
  ;;
esac
 
#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
 
#コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
 
#ログイン時にtmuxを自動起動
#if [ -z "$TMUX" -a -z "$STY" ]; then
#  if type tmuxx >/dev/null 2>&1; then
#    tmuxx
#  elif type tmux >/dev/null 2>&1; then
#    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE 
#'.*]$'; then
#       tmux attach && echo "tmux attached session "
#    else
#      tmux new-session && echo "tmux created new session"
#    fi
#  fi
#fi
