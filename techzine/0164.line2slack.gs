// LineBotから送られた情報を受け取る
function doPost(e) {
  // こちらも認証は必要だろう…
  var json = JSON.parse(e.postData.contents);
  to_slack(json.events[0].message.text);
}

// SlackのWeb着信フックにメッセージを送信する
function to_slack(message) {
  var URL = 'SlackのWeb着信から貼り付け'

  // Slack用のpayloadを作成する
  var jsonData = {
     "username" : '(username)',
     "text" : message
  };
  var payload = JSON.stringify(jsonData);

  var options = {
    "method" : "post",
    "contentType" : "application/json",
    "payload" : payload
  };
  UrlFetchApp.fetch(URL, options);
}
||<
