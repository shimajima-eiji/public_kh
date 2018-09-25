// Slackから送られた情報を受け取る
function doPost(e) {
  // 認証情報を取って正しいリクエストかどうかの判定はした方がいい

  to_line(e.parameter.text);
}

// LINE NotifyのWebフックにメッセージを送信する
function to_slack(message) {
  var TOKEN = '(LineBOTのAPIトークン)'
  var URL = 'https://notify-api.line.me/api/notify'

  // LINE Notifyのヘッダー。Curlコマンドを置き換えただけ
  var options = {
    "method" : "post",
    "payload": "message=" + message,
    "headers": {
      "Authorization" : "Bearer " + TOKEN
    }
  };
  UrlFetchApp.fetch(URL, options);
}
