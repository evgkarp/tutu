ready = function() {
  $('a.edit_station').click(function(e) {
    e.preventDefault();

    var stationId = $(this).data('stationId');
    var form = $('#edit_railway_station_' + stationId);
    var title = $('#railway_station_title_' + stationId);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Отмена');
      $(this).addClass('cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    };
    form.toggle();
    title.toggle();
  });
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
