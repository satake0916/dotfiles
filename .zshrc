# tmux autostart if not already in tmux.
if [[ ! -n $TMUX ]]; then
  count=`ps aux | grep tmux | grep -v grep | wc -l`
  if [[ $count -eq  0 ]] then
    tmux
  elif [[ $count -eq 1 ]] then
    tmux a
  fi
fi

# zsh autosuggestion
source /home/linuxbrew/.linuxbrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh completions
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# zsh syntax highlight
source /home/linuxbrew/.linuxbrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship
eval "$(starship init zsh)"

# Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# asdf
. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

# Created by `pipx` on 2023-12-24 03:26:22
export PATH="$PATH:/home/satake/.local/bin"

# vim mode
set -o vi
KEYTIMEOUT=1

