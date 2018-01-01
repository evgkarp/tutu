$(document).ready(function() {
  $('.wagons').change(function(){
    var wagonType = $(this).find('select').val();

    var upper_seats = $('#upper_seats').show();
    var lower_seats = $('#lower_seats').show();
    var side_upper_seats = $('#side_upper_seats').show();
    var side_lower_seats = $('#side_lower_seats').show();
    var seats = $('#seats').show();

    switch (wagonType) {
      case "EconomyWagon":
        seats.hide();
        break;
      case "CoupeWagon":
        side_upper_seats.hide();
        side_lower_seats.hide();
        seats.hide();
        break;
      case "SedentaryWagon":
        upper_seats.hide();
        lower_seats.hide();
        side_upper_seats.hide();
        side_lower_seats.hide();
        break;
      case "SleepingWagon":
        upper_seats.hide();
        side_upper_seats.hide();
        side_lower_seats.hide();
        seats.hide();
        break;
    };

    $('label').show();
    $('.form-control').filter(":hidden").each(function(index) {
      $('label[for="wagon_' + $(this).attr('id') + '"]').hide();
    });
  });
});
