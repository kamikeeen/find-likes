$(function(){
  let btn = $(".like__follow__btn") 
  let id = btn.attr('data')
  let ary = [{  url: "/api/users/add_like",
                type: "get",
                params: { id: id },
                text: "好きから外す"
              },
              { url: "/api/users/delete_like",
                type: "get",
                params: { id: id },
                text: "好きに追加する"
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