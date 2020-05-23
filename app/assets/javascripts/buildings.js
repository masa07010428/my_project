// 階情報入力部分の削除ボタンを隠す（form１つの場合）
$(document).on("turbolinks:load", function () {
  if ($(".nested-fields").length == 1) {
    $(".remove_fields").hide();
  }
});
