function doPost(e){
  /**
   * @param
   *    datetime(String)  : YYYYmmdd HHMMSS
   *    temperature(float): xx.x
   *    humidity (float)  : xx.x
   */
  var params = e.parameter;  // from sensor.py's post
  var reg_server_time = Utilities.formatDate(new Date(),"JST","yyyyMMdd HHmmss");  // JavaScriptで日付フォーマットを扱う場合、Utilitiesで行う
  var reg_client_time = params.datetime;
  var temperature = params.temperature;
  var humidity = params.humidity;

  result = call_add_TH([reg_server_time, reg_client_time, temperature, humidity]);
  message = result === true ? 'regist successful' : '[FAILED] regist data' + e;
  return ContentService.createTextOutput(message);  // ここはPython側でやりようがあるはず。returnの値が異常値だった場合に再送信するとか
}

function call_add_TH(array) {
  /**
   * register Google spread sheet
   */
  const SSID = 'Spread Sheet ID';
  const SHEET_NAME = 'your sheet';

  var sheet = SpreadsheetApp.openById(SSID)
  .getSheetByName(SHEET_NAME);
  sheet.appendRow(array);
  return true;
}
