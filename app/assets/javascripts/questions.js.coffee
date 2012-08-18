# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  # обрабатываем клик по кнопке добавления
  $('#add_answer').click ->
    $last = $('.answer:last') # последний ответ на странице

    $cloned = $last.clone() # клонируем его

    # получаем рандомное число
    randValue = new Date().getTime()

    # пробегаемся по всем элементам, у которых есть атрибут name или for
    $('[name], [for]', $cloned).each (index, item) ->
      $item = $(item)

      # если это текстовое поле, заменяем id и name
      if $item[0].nodeName is 'INPUT'
        $item.attr 'id', $item.attr('id').replace(/\d+/, randValue)
        $item.attr 'name', $item.attr('name').replace(/\d+/, randValue)

      # если это лейбл, то заменяем атрибут for
      $item.attr 'for', $item.attr('for').replace(/\d+/, randValue)  if $item[0].nodeName is 'LABEL'

    # скрываем добавляемый ответ, чтобы красиво появиться
    $cloned.hide()
    $cloned.appendTo $last.parent()
    $cloned.slideDown()

    false

  # при клике на удаление ответа, удаляем его
  $('body').delegate '.remove_answer', 'click', ->
    $(this).closest($('.answer')).slideUp ->
      $(this).remove()

    false
  
