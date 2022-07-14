# Path to your oh-my-zsh installation.
export ZSH="/home/troun/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# ==================

# https://unix.stackexchange.com/questions/167582/why-zsh-ends-a-line-with-a-highlighted-percent-symbol
PROMPT_EOL_MARK=''

# Simple terminal title
# https://superuser.com/questions/1242884/change-zsh-auto-titles-to-hide-user-and-host
ZSH_THEME_TERM_TITLE_IDLE="%~"

export PATH=/home/troun/.local/bin:$PATH
export PATH="/home/troun:$PATH"

# Automatically activate/deactivate python virtual envs
# https://stackoverflow.com/questions/45216663/how-to-automatically-activate-virtualenvs-when-cding-into-a-directory
function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
      # Activate if .venv exists
      if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
      fi
  else
      # Check if the current folders is inside
      # an earlier $VIRTUAL_ENV folder and deactivate if not
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}

# The highlight style for `zsh-autosuggestions`
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#30c593,underline"
# For `zsh-syntax-highlighting`
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp root)

# Highlight commands matching a regexp
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/regexp.md
typeset -A ZSH_HIGHLIGHT_REGEXP

ZSH_HIGHLIGHT_REGEXP+=('^indico\b' fg=#56b1fb,bold)
ZSH_HIGHLIGHT_REGEXP+=('^python3?\b' fg=#f4cc66,bold)

# Custom styling for different tokens
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=#de7717,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#ac80fa,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ac80fa,bold'
