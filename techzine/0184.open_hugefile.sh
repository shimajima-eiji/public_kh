# -*- coding: utf-8 -*-
import gc
gc.collect()

from linecache import getline  # ピンポイントに指定の行を取りたい

import os
import mmap  # アクセスが早いらしい
from subprocess import call  # linuxコマンドの方がよくね？と思って追加

###print(os.O_RDONLY, mmap.PROT_READ)  # これが何なのかわからない人は使ってみてください。
fname = '巨大ファイル'

import sys
from prettytable import PrettyTable
from time import time

# prettytableの準備
table = PrettyTable(["処理手法", "実行時間"])

# fileサイズの取得
filesize = os.path.getsize(fname)
print "FileSize: {} MB\n".format(int(filesize)/(1024*1024))

# ファイルに初回アクセスする
# これはすぐに完了する
start = time()
fileobj = open(fname)
fileobj.seek(0)
table.add_row(["open file", "{:.6f}".format(time() - start)])

### やりたいことはここから

# とりあえずファイルにさわる。
# →全部見てるんじゃ？
fileobj.seek(0)
start = time()
getline(fname, 1)
table.add_row(["getline", "{:.6f}".format(time() - start)])

# mmapによる計測
# 開き直る
fileobj.seek(0)
start = time()
buf = mmap.mmap(3, 0, prot=1)
lines= 0
readline = buf.readline
while readline():
    lines += 1
print lines
table.add_row(["mmap関数", "{:.6f}".format(time() - start)])

# ただのreadline。mmapと同じロジック。mmapすげーって思うぐらい時間がかかる
fileobj.seek(0)
start = time()
countline = fileobj.readline
lines = 0
while countline():
    lines += 1  # pythonは++インクリメントが使えない
print(lines)
table.add_row(["readline", "{:.6f}".format(time() - start)])

# Linuxコマンドによる計測
# 多分これが一番早いと思います
fileobj.seek(0)
start = time()
call(['wc', '-l', filename])
table.add_row(["wc -l", "{:.6f}".format(time() - start)])

# count関数による計測
# countじゃなくてreadが遅いってハッキリわかんだね
fileobj.seek(0)
start = time()
data = fileobj.read()
print data.count('\n')
table.add_row(["count関数", "{:.6f}".format(time() - start)])

# 単純ループによる計測
# forは悪くない事が証明できて満足。ただし問題は解決してない
fileobj.seek(0)
start = time()
s = 0
for l in fin:  # enumerateでも同じ
    s += 1
print s
table.add_row(["単純ループ", "{:.6f}".format(time() - start)])

# len関数による計測
# リスト内包表記だからlenより早いか？と思ったけど似たようなもの。早かった
fileobj.seek(0)
start = time()
print len([None for l in fileobj])
table.add_row(["len関数", "{:.6f}".format(time() - start)])

# みんなだいすきsum関数
fileobj.seek(0)
start = time()
print sum(1 for l in fin)
table.add_row(["sum関数", "{:.6f}".format(time() - start)])

# 結果の表示
fileobj.close()
del fileobj

print table.get_string(start=0)

gc.collect()
