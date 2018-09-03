/* 呼び出しは [$('#side-serika-memo textarea').trigger('bookmark');] で行う */
$(function() {
  /**
   * ブックマーク処理
   * 既に登録済みの場合は何もしない
   * このやり方だと他のページを登録していた時にトップページを登録出来ないバグがあるけど、（運用的に）そこまでやる必要ある？っていう仕様にします。
   * どうしても気になるならトップページについては'\n'を条件にすると良いでしょう。
   *
   * メモが初期値とか空白だったら上書き、それ以外は追記としています。
   * saveMemo()は私が作ったものではありません。メモ機能が適用されないのでserika氏のスクリプトをぶっこ抜いています。
   * github上には当該コードは盗用になるのと、バージョン管理ができないので載せません。
   * 詳細はadiary.orgをご覧ください。
   **/
  $('#side-serika-memo textarea').on('bookmark',function() {
    var this_url = location.href;

    if (this.value.indexOf(this_url) > -1) {
      return;
    }

    first_box = '自由にメモしておけるテキストエリアです。\nメモは、cookieに保存されます。';
    if (this.value == first_box || this.value == '') {
      this.value = this_url;
    }
    else {
      this.value = this.value + '\n' + this_url;
    }
    saveMemo();  // メモ機能の内容を参照できないのでぶっこ抜き
    alert("メモに" + this_url + "を登録しました");
  });

  /**
   * メモ機能の保存を抜き出して処理
   * これがないとセッションに保存されない
   **/
  function saveMemo(){
    /* adiaryのメモモジュール内を参照 */
  }
});
/*
# for usage
<button onclick="$('#side-serika-memo textarea').trigger('bookmark');">このページを後で見る（左のメモにこのページのURLが保存されます）</button>
*/
