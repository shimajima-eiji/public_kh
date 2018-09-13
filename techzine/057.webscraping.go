package main

import (
    "net/http"
    "strings"
    "encoding/json"
)

func list(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte(`
<html>
<head>
  <title>helloworld</title>
</head>
<body>
<table class="m_table s_tdCenter"><tbody>
<tr>
<th>7月31日（火）</th>
<td>
～
</td>
<td>
～
</td>
</tr>
（中略）
<tr>
<th>7月1日（日）</th>
<td>
～
</td>
<td>
～
</td>
</tr>
</tbody></table>
</body>
</html>
`))
}

func detail(w http.ResponseWriter, r *http.Request) {
    w.Write([]byte(`
<table class="m_table c_mb40">
<tbody>
<tr>
<th>路線名</th>
<th>遅れた時間</th>
</tr>
<tr>
<td>
遅延情報
</td>
<td>～</td>
</tr>
</tbody></table>
`))
}

func main() {
    http.HandleFunc("/delay/list", list)
    http.HandleFunc("/delay/detail/", detail)
    http.ListenAndServe("(PORT)", nil)
}
