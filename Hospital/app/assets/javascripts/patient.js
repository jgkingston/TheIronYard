
var validateName = function() {



$('.validation-form').focusin( function(){
  console.log("yes!")

  if($('.first-name-input').val() == ""){
    $('.first').show()
    console.log("blank detected")
  }
  else {
    console.log("filled")
    $('.first').hide()
  }

  if($('.last-name-input').val() == ""){
    $('.last').show()
    console.log("blank detected")
  }
  else {
    console.log("filled")
    $('.submit').removeAttr("disabled")
    $('.last').hide()
  }

  if($('.last-name-input').val() == "" || $('.first-name-input').val() == "") {
    $('.submit').attr("disabled","disabled")
    console.log("blank detected")
  }
  else {
    console.log("filled")
    $('.submit').removeAttr("disabled")

  }

})

}




$(document).ready(validateName);
$(document).on("page:load", validateName);