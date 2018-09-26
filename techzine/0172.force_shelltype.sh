#!/bin/bash

force='bash'
### filter
# not bash case, force bash
p=$(ps --pid $$ -o command | tail -1 | cut -f1 -d' ')
if [ ! "${p}" = "${force}" ] ; then
  if [ "$(which bash)" = '' ] ; then
    echo "${force}"': not installed.'
    exit 1
  fi

  bash ${0} "$@"
  exit 0
fi

# force bash
some commands...
