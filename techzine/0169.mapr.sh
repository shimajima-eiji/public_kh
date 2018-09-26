ssh_exec() {
  node=${server}$1
  ssh -i ${key_path} -p ${port} ${user}@${node} "${cmd}"
}

### user config
key_path=
port=
user=
server=

### reboot nodes
# cmd="service mapr-zookeeper stop; service mapr-warden stop;"
### restart service
# cmd="maprcli node services -name (collectd) -nodes '${node}' -action restart"
### cores present error
# cmd="find /opt/cores/ -type f -exec rm {} \;"

### exec
for i in $(seq -w XX); do ssh_exec $i; done
