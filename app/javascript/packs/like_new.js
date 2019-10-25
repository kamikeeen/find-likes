$(function(){
  $("#search__like__box").on("keyup", function(){
    let keyword = $(this).val() 
    if (keyword !== ""){
      $.ajax({
        url: "/api/likes/search",
        type: "get",
        data: {keyword: keyword},
        dataType: "html"
      })
      .done(function(html){
        $(".search-results").remove();
        $(".search__like").after(html)
      })
      .fail(function(){
      })
    }else{
      $(".search-results").remove()
    }
  })
})