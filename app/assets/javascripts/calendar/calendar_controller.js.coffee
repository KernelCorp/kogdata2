#= require fullcalendar
class @CalendarController

  myEventColor:          '#2D46AD'
  otherEventColor:       '#4C85BC'
  closedEventColor:      '#BABABA'
  calendar_selector:     '#calendar'
  create_event_selector: '#create-event-button'

  fullCalendarOption:
    header:
      left:   'prev'
      right:  'next'
      center: 'title'
      prev:   'circle-triangle-w'
      next:   'circle-triangle-e'
    firstDay: 1
    height: 600
    monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь']
    monthNamesShort: ['Янв.','Фев.','Март','Апр.','Май','Июнь','Июль','Авг.','Сент.','Окт.','Ноя.','Дек.']
    dayNames: ["Воскресенье","Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"]
    dayNamesShort: ["ВС","ПН","ВТ","СР","ЧТ","ПТ","СБ"]
    timeFormat: "%FT%T.%LZ"
    editable:   true
    droppable:  true
#		eventDrop:  @::update_event
#	# this allows things to be dropped onto the calendar !!!
#		drop:       @::add_event
#		eventClick: @::onEventClick
#		eventDragStart: @::onDragStart


  constructor: ->
    $(@calendar_selector).fullCalendar @fullCalendarOption
