from pathlib import Path
import datetime as dt

# この辺はshellから引数にしてもいいかも。
# 例のスクリプトをそのまま使う場合、ファイル名を使ってインジェクション攻撃が出来るので本番環境で使うならバリデーションすること
output = 'target'
server = len('server')
today = dt.datetime.today().strftime('%Y%m%d')

# 最大の時間を取る。最新のログがそこだから他のを参照するとノイズになりそう
max_date = 0
for path in Path(output).glob('**/*'):
  if not path.is_file():
    continue
  tmp = path.parent.name[9:11]
  max_date = max(int(tmp), max_date)

# サーバーがどれだけ止まっているかを調べたい
stops = []
for path in Path(output).glob('**/*'):
  if not path.is_file():
    continue
  elif not str(path).find('{}_{:02d}'.format(today, max_date)) > -1:
    continue
  elif not path.stat().st_size == 0:  # →ここをファイル内サーチにしてfree-mの値を使うとワーニングも出来る
    continue
    
  # ファイルであり、最新のログファイルであり、ファイルの容量が0byteのものはサーバーダウンの可能性がある
  stops.append(path.name[:server])

for stop_server in stops:
  # ここで通知処理。配列が0なら何もしない
  
