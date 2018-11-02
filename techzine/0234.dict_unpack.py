import sys

def func_single1(key1):
    print(sys._getframe().f_code.co_name ,key1)

def func_single2(*key1):
    print(sys._getframe().f_code.co_name, key1)

def func_single3(**key1):
    print(sys._getframe().f_code.co_name, key1)

def func_multi1(key1, key2):
    print(sys._getframe().f_code.co_name, key1, key2)

def func_multi2(key1, key2, key3):
    print(sys._getframe().f_code.co_name, key1, key2, key3)

def func_multi3():
    print(sys._getframe().f_code.co_name, 'multi3')

dic = {
 'key1': 'value1',
 'key2': 'value2'
}
funcs = [
  func_single1,
  func_single2,
  func_single3,
  func_multi1,
  func_multi2,
  func_multi3,
]

for func in funcs:
  try:
    func(dic)
  except:
    print('ERROR dic')

  try:
    func(*dic)
  except:
    print('ERROR *dic')

  try:
    func(**dic)
  except:
    print('ERROR **dic')

  print()
