### Ubuntuでのインストールを想定しています。
### ～～～ 分かりやすくするために敢えてホスト名を残しています。 ～～～
### ～～～ 間違ってもこのまま実行しないようにしてください。 ～～～

apt update
apt upgrade -y

# install adiary

## apache2
apt install -y apache2
a2enmod cgi
a2enmod rewrite
cat <<__EOS >>/etc/apache2/apache2.conf
<Directory /var/www/html>
        AllowOverride All
</Directory>

<Directory /var/www/html/a>
        Options ExecCGI SymLinksIfOwnerMatch
        AddHandler cgi-script .cgi
        Allow from All
</Directory>
__EOS
service apache2 restart

## adiary
cd /var/www/html

### .htaccess
cat <<__EOS >>.htaccess
RewriteEngine on
# https://nomuraya.work
RewriteCond     %{HTTP_HOST}            !^nomuraya\.work$
RewriteRule     ^(.*)$                  https://nomuraya.work/$1 [L]
RewriteCond     %{HTTPS}                !on
RewriteRule     ^(.*)$                  https://nomuraya.work/$1 [L]
# inner redirect [adiary path]
RewriteRule     ^(.*)$                  (adiary path)/$1             [L]
__EOS

## master
cd /var/www/html
apt install -y perlmagick libnet-ssleay-perl git
git clone https://github.com/nabe-abk/adiary (adiary path)
cd (adiary path)
chmod 777 __cache data pub
cp adiary.conf.cgi.sample adiary.conf.cgi
mv dot.htaccess .htaccess
# -->ALL remove to #(comment-out)

# FastCGI できない環境もあります
### 追記： FcgidMaxRequestLenはadiaryの画像アップデート容量で使われています。
### 初期値は128kbなので、サーバーの状態に合わせて変えないと使い物になりません。
apt install libapache2-mod-fcgid libfcgi-perl
cat <<__EOS >>/etc/apache2/mods-available/fcgi.conf
<IfModule mod_fcgid.c>
  FcgidMaxRequestLen    131072
  FcgidIOTimeout        120
</IfModule>
__EOS

sed -e "AddHandler cgi-script \.cgi/AddHandler fcgid-script \.fcgi" /etc/apache2/apache2.conf
# [Point]
#<Directory /var/www/html/adiary>
##        AddHandler cgi-script .cgi
#        AddHandler fcgid-script .fcgi
#</Directory>

a2enmod fcgid 
service apache2 restart

# SSL 出来ない環境もあります
# Refer: https://qiita.com/k-yamada-github/items/7314003de7bdcbb2d39b

cd /(certbot)
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
./certbot-auto --apache --expand -d nomuraya.work -d www.nomuraya.work -m (mail address)
# Agree/Cancel: A
# Yes/No: Y
# [1-2]: 2
./certbot-auto renew --force-renew

sed -e /etc/apache2/sites-available/default-ssl.conf
### [POINT]
## SSLCertificateFile     /etc/ssl/certs/ssl-cert-snakeoil.pem
#SSLCertificateFile      /etc/letsencrypt/live/nomuraya.work/fullchain.pem
## SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
#SSLCertificateKeyFile   /etc/letsencrypt/live/nomuraya.work/privkey.pem

a2enmod ssl
a2ensite default-ssl
service apache2 restart
