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

document.addEventListener('DOMContentLoaded', function() {

  // プロフィール画像のプレビュー
  const inputFile = document.getElementById('img_input');
  inputFile.addEventListener('change', function(e) {
    const file = e.target.files[0];
    const size = file.size/1024/1024; // megabytes

    // ファイルサイズの検証
    if(size > 1) {
      alert('選択できるファイルサイズは1MB以下です。');
      inputFile.value = '';
    }

    else {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        let prev = document.getElementsByClassName('img_prev');
        for(let i=0; i < prev.length; i++) {
          prev[i].src = reader.result;
        }
      }
    }
  });

});
