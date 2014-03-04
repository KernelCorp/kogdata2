class @EventsController

  url = '/events'

  index: () ->
    results = $.ajax(url,
      dataType: 'json'
      type:     'GET'
      async:    false,
    ).responseText;
    $.parseJSON(results)