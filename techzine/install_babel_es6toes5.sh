# 記事版間違えました。0131です

# nodeインストール
# 構築時点の安定版
wget https://nodejs.org/dist/v8.11.4/node-v8.11.4-linux-x64.tar.xz
tar -xvf node-v8.11.4-linux-x64.tar.xz
mv node-v8.11.4-linux-x64 node
cd node

# node 8.11
echo 'export NODE_HOME="$(pwd)"' >>~/.bashrc
echo 'export NODE_PATH="$NODE_HOME/lib/node_modules"' >>~/.bashrc
echo 'export PATH="$NODE_HOME/bin:$PATH"' >>~/.bashrc
source ~/.bashrc

# .babelrcの設定。個人的にはフォーマットされた形式のjsonで見たいのでcatにするとか、後で改行しました
echo '{"presets": ["latest"]}' >~/.babelrc

 # 記事本編：ここから
 node --version
# v8.11.4
npm --version
# 5.6.0

# projectは任意のパス

mkdir (project) && cd (project)
# package.jsonを入れておく
npm install

# browserifyがうまく入ってなかったのでglobalに入れなおす
npm install -g browserify

# クラス.jsと実行.jsを用意。ここでは実行.jsをrun.jsとする

# babelで書いたrun.jsをgasにしてgas.jsで保存して、と意訳
browserify -t babelify -p gasify run.js -o gas.js

# 作ったgas.jsをコピペしてGASのプロジェクトにコピーする
