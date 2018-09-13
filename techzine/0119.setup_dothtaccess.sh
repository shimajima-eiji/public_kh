### for Ubuntu
## start setup.sh
# mod_pagespeed.c
wget https://dl-ssl.google.com/dl/linux/direct/mod-pagespeed-stable_current_amd64.deb
# curl可。入ってなければsudo apt install curlでインストールしておく
sudo dpkg -i mod-pagespeed-stable_current_amd64.deb

# 念のため最新化
sudo apt update
sudo apt upgrade -y

# mod_expires.c
sudo a2enmod expires

# mod_deflate.c
sudo a2enmod deflate  # filterも入るかも？

# 設定を適用する
sudo service apache2 restart

## end setup.sh

### create .htaccess
cat <<__EOS__ >(e.g. path to index.html)/.htaccess
## expires.c
# ブラウザへのキャッシュの設定
ExpiresActive On

# キャッシュの初期化（1秒に設定）
ExpiresDefault "access plus 1 seconds"

# MIME Type ごとのキャッシュ設定
ExpiresByType text/css "access plus 1 weeks"
ExpiresByType text/js "access plus 1 weeks"
ExpiresByType text/javascript "access plus 1 weeks"
ExpiresByType image/gif "access plus 1 weeks"
ExpiresByType image/jpg "access plus 1 weeks"
ExpiresByType image/jpeg "access plus 1 weeks"
ExpiresByType image/png "access plus 1 weeks"
ExpiresByType image/svg+xml "access plus 1 year"
ExpiresByType application/pdf "access plus 1 weeks"
ExpiresByType application/javascript "access plus 1 weeks"
ExpiresByType application/x-javascript "access plus 1 weeks"
ExpiresByType application/x-shockwave-flash "access plus 1 weeks"
ExpiresByType application/x-font-ttf "access plus 1 year"
ExpiresByType application/x-font-woff "access plus 1 year"
ExpiresByType application/x-font-opentype "access plus 1 year"
ExpiresByType application/vnd.ms-fontobject "access plus 1 year"

## deflate.c
# mod_deflate.cを有効にする
SetOutputFilter DEFLATE

# 画像や圧縮ファイルなどを対象にしない
SetEnvIfNoCase Request_URI \.(?:gif|jpe?g|png|ico) no-gzip dont-vary
SetEnvIfNoCase Request_URI _\.utxt$ no-gzip

# 圧縮の対象にする拡張子などを明示的にする
AddOutputFilterByType DEFLATE text/plain
AddOutputFilterByType DEFLATE text/html
AddOutputFilterByType DEFLATE text/xml
AddOutputFilterByType DEFLATE text/css
AddOutputFilterByType DEFLATE application/xhtml+xml
AddOutputFilterByType DEFLATE application/xml
AddOutputFilterByType DEFLATE application/rss+xml
AddOutputFilterByType DEFLATE application/atom_xml
AddOutputFilterByType DEFLATE application/javascript
AddOutputFilterByType DEFLATE application/x-javascript
AddOutputFilterByType DEFLATE application/x-httpd-php
__EOS__
