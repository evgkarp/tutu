ready = function() {
  $('a.edit_train').click(function(e) {
    e.preventDefault();

    var trainId = $(this).data('trainId');
    var form = $('#edit_train_' + trainId);
    var number = $('#train_number_' + trainId);

    if (!$(this).hasClass('cancel')) {
      $(this).html('Отмена');
      $(this).addClass('cancel');
    } else {
      $(this).html('Редактировать');
      $(this).removeClass('cancel');
    };
    form.toggle();
    number.toggle();
  });
};

$(document).ready(ready);
$(document).on('turbolinks:load', ready);
