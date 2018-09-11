container_name='container'
sudo docker run -it -d --name ${container_name} ubuntu:16.04
sudo docker exec -it ${container_name} bash

# after login docker
cd ~
apt update
apt install curl wget

git clone https://gist.github.com/824f52dd5ddee4c84bc5972c206d073d.git install
# Dockerで行う場合、ruby.shのsudoは削除してください。
./install/ruby.sh

# リポジトリ:./0141.slackbot.rb を格納する

bundle init
echo 'gem "slack-api"' >>Gemfile
bundle install

# 実行させる時はslackbot.rbを実行するか呼び出す
bundle exec ruby slackbot.rb
