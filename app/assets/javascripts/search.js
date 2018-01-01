$(document).ready(function() {
  $('.search-form').change(function() {
    var fromStation = $('.from-station').val();
    var toStation = $('.to-station').val();
    $('.to-station').find('option').show();
    $('.to-station').find("option[value='"+fromStation+"']").hide();
    $('.from-station').find('option').show();
    $('.from-station').find("option[value='"+toStation+"']").hide();
  });

  $('.search-form').submit(function() {
    var fromStation = $(this).find('.from-station').val();
    var toStation = $(this).find('.to-station').val();
    if((fromStation == false) || (toStation == false)) {
      return false;
    };
  });
});


