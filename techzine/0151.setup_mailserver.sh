# docker client
sudo apt install docker.io
sudo docker run -d --name (container name) -i -t ubuntu bash
sudo docker exec -it (container name) bash

# docker root

## add user
adduser
# (user)
# (pass)
# Enter
# Enter
# Enter

### add sudo
apt install sudo
gpasswd -a (user) sudo 

## install ja_JP.UTF-8
apt install language-pack-ja-base language-pack-ja
locale-gen ja_JP.UTF-8

cat <<__EOS__ >>/home/(user)/.bash_profile 
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:jp
export LC_ALL=ja_JP.UTF-8
__EOS__
chown user:user /home/user/.bash_profile

## setup ssh-server
apt install openssh-server
service ssh start
# OK

## install python
apt install python-pip
pip install gmail

exit

# docker client

## sudo docker inspect (container name) | grep IPAddress
ssh (user)@(docker container ip)
# pass

# docker user
python sendmail_from_gmail.py
