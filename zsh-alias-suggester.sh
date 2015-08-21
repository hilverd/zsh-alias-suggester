# https://github.com/hilverd/zsh-alias-suggester
#
# Source this script from your .zshrc
# For example:
#
#   source /path/to/zsh-alias-suggester.sh

autoload -U add-zsh-hook

before_cmd_hook() {
  command=$1

  shortened_command=$(shorten_command $command)
  if [ $shortened_command != $command ]; then
      RPROMPT='shorter: %{$fg_bold[red]%}'$shortened_command'%{$reset_color%}'
  else
    RPROMPT=''
  fi
}

add-zsh-hook preexec before_cmd_hook

function shorten_command() {
  cmd=$1

  longest_matching_alias=''
  longest_matching_alias_rhs=''

  for k in "${(@k)aliases}"; do
    alias_rhs=$aliases[$k]

    if [[ $cmd == $alias_rhs' '* ]] || [[ $cmd == $alias_rhs ]]; then
        if [[ $longest_matching_alias_rhs == '' ]] || [[ $alias_rhs == $longest_matching_alias_rhs* ]]; then
            longest_matching_alias=$k
            longest_matching_alias_rhs=$alias_rhs
        fi
    fi
  done

  cmd_using_alias=$longest_matching_alias${cmd/$longest_matching_alias_rhs/}

  echo "$cmd_using_alias"
}
