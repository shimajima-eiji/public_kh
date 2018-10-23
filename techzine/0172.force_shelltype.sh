force_shelltype() {
  p=$(ps --pid $$ ho command | awk '{print $1}')
  if [ ! "${p}" = 'bash' ] ; then
    bash $0 $@
    exit 0
  fi
}
force_shelltype $@

p=$(ps --pid $$ ho command | awk '{print $1}')
echo ${p} $@
