# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#add_answer').click ->
    $last = $('.answer:last')

    $cloned = $last.clone()

    $('[name], [for]', $cloned).each (index, item) ->
      $item = $(item)
      
      randValue = new Date().getTime()

      if $item[0].nodeName is 'INPUT'
        $item.attr 'id', $item.attr('id').replace(/\d+/, randValue)
        $item.attr 'name', $item.attr('name').replace(/\d+/, randValue)

      $item.attr 'for', $item.attr('for').replace(/\d+/, randValue)  if $item[0].nodeName is 'LABEL'

    $cloned.hide()
    $cloned.appendTo $last.parent()
    $cloned.slideDown()

    false

  $('body').delegate '.remove_answer', 'click', ->
    $(this).closest($('.answer')).slideUp ->
      $(this).remove()

    false
  
