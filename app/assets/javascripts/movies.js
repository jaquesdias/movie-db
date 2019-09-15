$(function () {
  $('.edit_movie').hide();

  $('.rate_movie').unbind().click(function(e){
    e.preventDefault();
    $(this).next('.edit_movie').show();
  });
});
