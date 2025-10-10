document.addEventListener('turbolinks:load', function() {
  const clickArea = document.getElementById('profile-image-click-area');
  const fileInput = document.getElementById('profile-image-input');
  
  if (clickArea && fileInput) {
    clickArea.addEventListener('click', function() {
      // プロフィール画像をクリックしたとき、非表示のファイルフィールドをクリックする
      fileInput.click();
    });
  }
});