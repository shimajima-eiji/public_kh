/** sample
<!-- Copyright -->
<span id="copyright"></span>
*/

$(function(write_date){
  var article = new Date(write_date);
  var y = article.getFullYear();
  
  /** 欲しいのはここまで。以下、参考情報
  var m = article.getMonth() + 1;
  var d = article.getDate();
  var w = article.getDay();
  var wd = ['日', '月', '火', '水', '木', '金', '土'];
  var h = article.getHours();
  var mi = article.getMinutes();
  var s = article.getSeconds();
  // 参考情報　ここまで */
  
  // id:copyrightに張り付ける
  $('#copyright').text("Copyright: https://nomuraya.work/ since " + y);
});
