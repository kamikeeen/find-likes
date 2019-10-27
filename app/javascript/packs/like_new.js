$(function(){
  var genre_html = `<div class="like-form__detail">
                      <label for="like_genre_id">ジャンルを選択してください</label>
                      <br>
                      <select name="like[genre_id]" id="like_genre_id"><option value="">---</option>
                        <option value="1">映画</option>
                        <option value="2">アニメ</option>
                        <option value="3">音楽</option>
                        <option value="4">漫画</option>
                        <option value="5">その他</option></select>
                    </div>
                    <input type="submit" name="commit" value="好きを作成!" class="create-btn" data-disable-with="好きを作成!">`

  $("#search__like__box").on("keyup", function(){
    let keyword = $(this).val() 
    $("#like_name").val(keyword)
    if (keyword !== ""){
      $.ajax({
        url: "/api/likes/search",
        type: "get",
        data: {keyword: keyword},
        dataType: "html"
      })
      .done(function(html){
        $(".result").remove();
        $(".search__like").after(html)
      })
      .fail(function(){
      })
    }else{
      $(".result").remove()
    }
  })
  $(document).on("click", ".result__create-btn", function(){
    $(".like-form__detail").remove()
    $(".create-btn").remove()
    $(".result").append(genre_html)
  })
})