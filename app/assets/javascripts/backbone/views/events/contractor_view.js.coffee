Kogdata2.Views.Events ||= {}

class Kogdata2.Views.Events.ContractorView extends Backbone.View
  template: JST["backbone/templates/events/index_in_day"]
  right_block: '#right_block'
  calendar: "<div class='back_white_box'><div class='calendar-container'><div id='calendar'></div></div></div>"
  initialize: () ->
#    @options.events.bind('reset', @addAll)

  render_calendar_widget: =>
    $(@right_block).html(@calendar)
    window.calendarController = new ContractorCalendarController()
    $('.fc-button-prev').click =>
      window.eventsRouter.contractor_index()
      return
    $('.fc-button-next').click =>
      window.eventsRouter.contractor_index()
      return
    return


  addAll: (month_num, year_num) =>
#    @options.events.each(@addOne)
    if $('.calendar-container').length == 0
      @render_calendar_widget()
    if month_num
      calendarController.set_month(month_num)
      calendarController.set_year(year_num)
    if document.URL.match /#calendar\/\d+\/\d+/
      new_url = document.URL.replace(/#calendar\/\d+\/\d+/, "#calendar#{calendarController.month_and_year_for_url()}" )
      window.location = new_url
    else
      window.location += calendarController.month_and_year_for_url()
    filtered_collection = window.calendarController.select_up_to_date_events(@collection.models)
    window.calendarController.update filtered_collection


  addOne: (event) =>
    view = new Kogdata2.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render_all: (month_num, year_num)=>
    $('#events_in_day').remove()
    @addAll(month_num, year_num)

  get_filtered_collection: (date)->
    filtered_collection = []
    for event in @collection.models
      event_date = new Date(event.attributes.date)
      filtered_collection.push event if event_date.getDate() == date.getDate() && event_date.getMonth() == date.getMonth() && event_date.getFullYear() == date.getFullYear()
      console.log filtered_collection
    return filtered_collection

  render_day: (date)=>
    date = new Date(date)
    filtered_collection = @get_filtered_collection(date)
    $('body').append(@template(events: filtered_collection))
    $('.make_request').click ->
      $.ajax {
        url: $(this).attr('href')
        method: 'post'
        format: 'json'
        success: =>
          $(this).hide 'slow'
          return
      }
      return false
    return

    return this
