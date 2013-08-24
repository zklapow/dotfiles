# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{blue}%}±%{%f%k%b%}"
  else
    echo ' '
  fi
}

function virtualenv_prompt_info(){
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path ]]; then
    local virtualenv_name=`basename $virtualenv_path`
    printf "%s[%s] " "%{${fg[yellow]}%}" $virtualenv_name
  fi
}

function battery_pct_prompt () {
  if [[ $(ioreg -rc AppleSmartBattery | grep -c '^.*"ExternalConnected"\ =\ No') -eq 1 ]] ; then
    b=$(battery_pct_remaining)
    if [ $b -gt 50 ] ; then
      color='green'
    elif [ $b -gt 20 ] ; then
      color='yellow'
    else
      color='red'
    fi
    echo "%{%F{$color}%}[$(battery_pct_remaining)%%]"
  else
    echo "%{%F{green}%}∞"
  fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%K{black}%B%F{green}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}%m%{%B%F{green}%} $(virtualenv_prompt_info)%{%b%F{yellow}%K{black}%}%~%{%B%F{green}%}$(git_prompt_info)%E%{%k%b%f%}
%{%K{black}%}$(_prompt_char)%{%K{black}%} %#%{%f%k%b%} '

#RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'
RPROMPT='$(battery_pct_prompt)'
