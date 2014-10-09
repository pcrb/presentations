$(document).on 'ready page:load', ->
  $('.sortable:not([data-ajax-sort-action])').sortable
    axis: 'y',
    items: '.item',
    cursor: "grabbing",
    stop: (event, ui) ->
      ui.item.effect('highlight', {}, 1000)
    ,
    update: (event, ui) ->
      $(".sortable .item").each (positionIndex, element) ->
        $(element).find(".position").val(positionIndex);
      # note that :odd and :even are zero based, but our striping is 1 based, so switch them
      $(".sortable .item:odd").removeClass("odd").addClass("even")
      $(".sortable .item:even").removeClass("even").addClass("odd")
  $('.sortable[data-ajax-sort-action]').sortable
    axis: 'y',
    items: '.item',
    cursor: "grabbing",
    stop: (event, ui) ->
      ui.item.effect('highlight', {}, 1000)
    ,
    update: (event, ui) ->
      # note that :odd and :even are zero based, but our striping is 1 based, so switch them
      $(".sortable .item:odd").removeClass("odd").addClass("even")
      $(".sortable .item:even").removeClass("even").addClass("odd")
      position = $(ui.item).index('.sortable .item')
      item_id = ui.item.data('item-id')
      post_path = $(this).data('ajax-sort-action')
      $.ajax(
        type: 'POST'
        url: post_path
        dataType: 'json'
        data: { id: item_id, display_order_position: position }
      )
