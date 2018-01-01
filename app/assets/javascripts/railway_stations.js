ready = function() {
  $('a.edit_station').click(function(e) {
    e.preventDefault();

    station_id = $(this).data('stationId');
    form = $('#edit_railway_station_' + station_id);
    title = $('#railway_station_title_' + station_id);

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
