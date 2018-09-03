def scraiping():
  # return スクレイピングの結果を配列で返す

strings = scraiping()
def create(month, day, under_10, over_10):
  """
  .formatに入れたいだけの関数
  autopep8掛けるとlambdaを解体されるのでブログ用にも解体
  """
  return {
    'year': 2018,  # 12月と1月が混在している表から取得する等の場合： today.year -1 if today.month < month else today.year
    'month': month,
    'day': day,
    'under_10': over_10,
    'over_10': under_10,
  }

table_list = []
for i, string in enumerate(strings):
  """
  filterとかmapを組み合わせてもいいけど、一列に表示させたいものが配列の連続的処理でやりたい
  """
  if not string in '月':  # m月d日〇曜日
    continue

  point_month = string.find('月')
  month = string[:point_month ]

  point_day = string.find('日')  # 最初の日が取れる
  day = string[point_month +1:point_day ]
  under_10 = strings[i+1]
  over_10 = strings[i+2]

  structs = create(month, day, under_10, over_10):
  table_list.append("|{year}|{month}|{day}|{under_10}|{over_10}|".format(**structs))

table_list.reverse()
map(print, table_list)
