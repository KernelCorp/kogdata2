Kogdata2.Views.EventRequests ||= {}

class Kogdata2.Views.EventRequests.IndexView extends Backbone.View
  template: JST["backbone/templates/event_requests/index"]

  initialize: () ->
    @collection.bind 'reset', @addAll

  addAll: () =>
    @collection.each @addOne

  addOne: (eventRequest) =>
    view = new Kogdata2.Views.EventRequests.EventRequestView model: eventRequest
    @$("tbody").append view.render().el
    console.log eventRequest
    if @$(".write_contractor .write").attr("href") is "#"
      @$(".write_contractor .write").click ->
        $.ajax
          url: "/conversations/create_with_user"
          data: {user_id: eventRequest.attributes.photograph_id}
          type: "post"
          format: "json"
          success: (conversation)->
            window.location = "#conversations/#{conversation.conversation_id}"
            return
        false

  render: =>
    $(".gallery").remove() if $(".gallery")
    $(@el).html(@template(eventRequests: @collection.toJSON() ))
    @addAll()

    return this
