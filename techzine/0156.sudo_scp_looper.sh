#!/bin/sh

# install
### yes
### sshpass
### Recommend: use ssh-keygen

# functions
### need sh's array
init_array() {
  echo "$@"
}

# init
### user input
servers=$(init_array 'server01' 'server02' ...)

### params
user='(user)'
pass='(pass)'
port=(port)
cmd="$@"

# exec
for server in ${servers}
do
  # echo ${server}  # for debug
  yes "${pass}" | \
    sshpass -p "${pass}" \
    ssh -p ${port} -t -t -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null ${user}@${server} \
    "sudo -S ${cmd}" 2>/dev/null
done

# Extra: Case, permission defied 'SCP'. Can Copy file
cmd="dd if=${log}/${file} 2>/dev/null"
second_cmd="| dd of=${target}/${file} 2>/dev/null"

# Extra: after ssh login, check cmd result is True. Only exec
cmd='if [ "$(${if_cmd})" ] ; then ${exec_cmd}; fi'
