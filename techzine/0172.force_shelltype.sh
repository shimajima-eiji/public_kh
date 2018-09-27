force_shelltype() {
  force=$1

  # not case, force sh
  p=$(ps --pid $$ ho command | awk '{print $1}')
  if [ ! "${p}" = "${force}" ] ; then
    check_sh="$(echo ${force} | grep sh)"
    if [ "${check_sh}" = '' ] ; then
      echo "${sh_type}: not sh"
      exit 1
    elif [ "$(which ${check_sh} 2>/dev/null | grep sh)" = '' ] ; then
      echo "${sh_type}"': not installed.'
      exit 1
    else
      # memo: $@=${@:1}
      $1 ${0:@}
      exit 0
    fi
  fi
}

sh_type=$1
force_shelltype ${sh_type}

# Expected Result: sh ${0}
ps --pid $$ ho pid,command
