# === Fedora

## date -> JST
yum install tzdata
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
date
# JST

## lang -> ja_JP
yum install langpacks-ja


# === Ubuntu

## date -> JST
apt install tzdata
# 6. Asia
# 78. Tokyo(Japanではない)
dpkg-reconfigure tzdata  # 
date
# JST

## lang -> ja_JP
apt install language-pack-ja-base language-pack-ja
locale-gen ja_JP.UTF-8


# lang common
cat <<__EOS__ >>~/.bash_profile 
export LANG=ja_JP.UTF-8
export LANGUAGE=ja_JP:jp
export LC_ALL=ja_JP.UTF-8
__EOS__
source ~/.bash_profile

date
# ja_JP
