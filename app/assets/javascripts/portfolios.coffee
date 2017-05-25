ready = undefined
setPositions = undefined

setPositions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

ready = ->
  setPositions()
  $('.sortable').sortable()
  $('.sortable').sortable().bind 'sortupdate', (e, ui) ->
    updated_order = []
    setPositions()
    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id')
        position: i + 1
      return
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort'
      data: order: updated_order
    return
  return

$(document).ready ready