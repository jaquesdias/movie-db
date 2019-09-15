$(function () {
  $('.rate_movie').unbind().click(function(e){
    e.preventDefault();
    $(this).next('.rating_form').show();
  });
});
