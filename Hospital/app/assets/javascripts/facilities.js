
var pageSomething = function() {

  $('a.paginator').click( function() {
    var id = ".group_" + $(this).html()
    console.log(id)
    $('.slice').hide()
    $(id).removeClass('hidden').show()
  })

}

$(document).ready(pageSomething);
$(document).on("page:load", pageSomething);