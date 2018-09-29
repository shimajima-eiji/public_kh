/**
 * 参考程度に
 */
function doPost(e) {
  // [TODO]: バリデーションや入力値をいい感じに取得する
  main(e.parameter);
}

/**
 * メイン関数
 */
function main(params) {
  var fileID = getProperty('(プロパティ名)');
  var fileContent = getFileRead (fileID);

  // [TODO]: 以下色々な処理をやる
}

/**
 * GASのプロパティに登録している内容を任意に取得する
 * 厳密には外部化ではない
 */
function getProperty(property_name) {
  return PropertiesService
  .getScriptProperties()
  .getProperty(property_name);
}

/**
 * ファイルIDの内容を取得する。
 * ファイルの文字コードがUTF-8に限る
 */
function getFileRead (fileID) {
  return DriveApp
  .getFileById(fileID)
  .getBlob()
  .getDataAsString("utf8");
}
