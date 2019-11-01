$(function(){
  let btn = $(".follow-btn") 
  let id = btn.attr('data')
  let ary = [{  url: "/api/users/follow",
                type: "get",
                params: { id: id },
                text: "フォロー中"
              },
              { url: "/api/users/unfollow",
                type: "get",
                params: { id: id },
                text: "フォロー"
              }
            ]
  btn.on("click", function(){
    let flag = btn.hasClass("yet")
    let data = flag ? ary[0] : ary[1]
    $.ajax({
      url: data.url,
      type: data.type,
      data: data.params,
      dataType: 'json'
    })
    .done(function(){
      flag ? btn.removeClass("yet") : btn.addClass("yet")
      btn.text(data.text)
    })
    .fail(function(){
    })
  })
})