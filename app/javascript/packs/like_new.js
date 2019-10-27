$(function(){

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
    $.ajax({
      url: "/api/likes/select_genre",
      type: "get",
      dataType: "html"
    })
    .done(function(html){
      $(".like-form__detail").remove()
      $(".create-btn").remove()
      $(".result").append(html)
    })
    .fail(function(){
    })
  })
})