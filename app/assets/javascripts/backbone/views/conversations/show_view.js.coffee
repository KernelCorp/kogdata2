Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.ShowView extends Backbone.View
  template: JST["backbone/templates/conversations/show"]

  events:
    "submit #new-message": "saveMessage"

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this

  saveMessage: (e)->
    e.preventDefault()
    e.stopPropagation()
    $.ajax {
      url: "/conversations/#{@model.id}/messages",
      data: $("#new-message").serialize(),
      dataType : "json",
      type : 'POST',
      success: =>
        window.location.hash = "/conversations/#{@model.id}"
        @model.fetchMessages()
        @render()
    }