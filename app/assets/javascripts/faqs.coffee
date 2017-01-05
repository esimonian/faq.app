jQuery ->
  $('#faqs').sortable
    axis: 'y'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

jQuery ->
  $('.best_in_place').best_in_place()