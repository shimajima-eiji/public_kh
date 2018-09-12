# -*- coding: utf-8 -*-

import grovepi
from datetime import datetime
from requests import post

GROVEPI_CONNECT_D = 'your range(1-8)'

sensor = grovepi.dht(GROVEPI_CONNECT_D , 0)  # return tuple
result = {
    "datetime":datetime.today().strftime('%Y%m%d %H%M%S'),  # registed time from sensor
    "temperature":sensor[0],
    "humidity":sensor[1],
    }

url = '(GAS API/exec)'
response = post(url, data=result)

# Case error: retry?
