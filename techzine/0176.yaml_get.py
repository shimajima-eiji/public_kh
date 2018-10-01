# -*- coding:utf-8 -*-
# pip install python-box: https://pypi.org/project/python-box/
# pip install pyyaml: https://github.com/yaml/pyyaml.git
# box自体はdict型を.で使えるようにするものなので、json.load等でも使える

# setup
from os.path import join, dirname, abspath
CURRENT = dirname(dirname(abspath(__file__)))

import sys
sys.path.append(CURRENT)
from myutil import *  # myutilディレクトリ以下にある__init__.pyでimportしたものを取り込む
# from python-box.box import Box
# from pyyaml as yaml

# initialize
target = sys.argv[1]

# yamlを.(attribute)で取れるようにする
params = Box(yaml.load(open(join(CURRENT, 'config', 'params.yaml'))))
params[target].name
