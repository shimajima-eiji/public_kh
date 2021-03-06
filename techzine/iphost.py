# /develop/cmd/python/socket
# /develop/cmd/python/pandas_csv
# python3.6.5

from pathlib import Path
import pandas as pd
import socket

def ip2host(ip):
    try:
        return socket.gethostbyaddr(ip)[0]
    except socket.error:
        return pd.np.nan

### constant
source = Path(ip's list text)
output = Path(output text)
ip_column = (ip)
host_column = (host)

### execute
output.mkdir(parents=False, exist_ok=True)
for csv in source.glob('*'):
    df = pd.read_csv(csv)
    exec_df = df[df[host_column].isnull()][ip_column]
    results = map(ip2host, exec_df)
    df.ix[exec_df.index, host_column] = list(results)
    df.to_csv(output.joinpath(csv.name))
