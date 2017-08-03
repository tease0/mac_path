#zshの設定
autoload -Uz colors
colors
autoload -U compinit
compinit

# プロンプト
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' max-exports 6 # formatに入る変数の最大数
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '%b@%r' '%c' '%u'
zstyle ':vcs_info:git:*' actionformats '%b@%r|%a' '%c' '%u'
setopt prompt_subst
function vcs_echo {
    local st branch color
    STY= LANG=en_US.UTF-8 vcs_info
    st=`git status 2> /dev/null`
    if [[ -z "$st" ]]; then return; fi
    branch="$vcs_info_msg_0_"
    if   [[ -n "$vcs_info_msg_1_" ]]; then color=${fg[green]} #staged
    elif [[ -n "$vcs_info_msg_2_" ]]; then color=${fg[red]} #unstaged
    elif [[ -n `echo "$st" | grep "^Untracked"` ]]; then color=${fg[blue]} # untracked
    else color=${fg[cyan]}
    fi
    echo "%{$color%}(%{$branch%})%{$reset_color%}" | sed -e s/@/"%F{yellow}@%f%{$color%}"/
}
PROMPT='
%F{yellow}[%~]%f `vcs_echo`
%(?.$.%F{red}$%f) '


#パスなど
export PATH=/usr/local:$PATH#vim用
export PATH=$HOME/.nodebrew/current/bin:$PATH#nodejs
export PATH="/Library/TeX/texbin:$PATH"#tex
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export LESS='-R'
alias cot='open $1 -a "/Applications/CotEditor.app"'
alias sudo='sudo '
export PATH="$HOME/.rbenv/bin:$PATH"


if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(goenv init -)"

#lsの色付け
alias ls='gls --color=auto -F'
eval $(gdircolors ~/dircolors-solarized/dircolors.ansi-universal)
# 補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


# 日本語を使用
export LANG=ja_JP.UTF-8
# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep
#history
export HISTFILE=~/.zsh_history
# 他のターミナルとヒストリーを共有
setopt share_history
# 複数のzshを同時に使用した際に履歴ファイルを上書きせず追加する
setopt append_history
HISTSIZE=5000
SAVEHIST=5000
setopt HIST_NO_STORE        # histroyコマンドは記録しない

# コマンドミスを修正
setopt correct
# ビープ音を鳴らさない
setopt no_beep
# 補完候補表示時にビープ音を鳴らさない
setopt nolistbeep
