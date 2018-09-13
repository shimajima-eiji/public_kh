# Precondition: LANG=ja_JP
# 0145あたりが参考になります

# ---  start  ---
apt install ssmtp

## Config: /etc/ssmtp/ssmtp.conf
cat <<__EOS__ >/etc/ssmtp/ssmtp.conf
AuthUser=(account_user)@gmail.com
AuthPass=(account_pass)
FromLineOverride=YES
mailhub=smtp.gmail.com:587
UseSTARTTLS=YES
__EOS__

## mail(ja_JP)
cat <<__EOS__ > containts.txt
To: (user)@gmail.com
From: (user)@gmail.com
Subject: 自分から自分へ送信テスト

ついでに日本語で送って文字化けしないのも確認
__EOS__

## Sendmail
sendmail -t < contaits.txt
