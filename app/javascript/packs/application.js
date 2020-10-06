// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("jquery")
require("bootstrap/dist/js/bootstrap")

// プロフィール画像のプレビュー
$(function() {
  $('#img_input').change(function(e) {
    // ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    var size_in_megabytes = e.target.files[0].size/1024/1024;

    // アップロードする画像のファイルサイズをチェックする
    if (size_in_megabytes > 1) {
      alert('最大ファイルサイズは1MBです。小さいファイルを選択してください。');
      $('#img_input').val('');
    }

    // アップロードした画像をプレビューする
    else {
      reader.onload = (function(file) {
        return function(e) {
          $('#img_prev').attr('src', e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    }

  });
});
