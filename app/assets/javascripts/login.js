$(document).ready(function(){
  $('#new_user').on('submit', function(e) {
    e.preventDefault();

    $.ajax({
      method: 'POST',
      url: '/login',
      data: $(e.target).serialize(),
      dataType: 'json'
    }).done(function(data){

    }).fail(function(error){
      console.error("Unable to login, try again");
    });
  })
})
