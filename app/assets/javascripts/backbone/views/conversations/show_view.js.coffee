Kogdata2.Views.Conversations ||= {}

class Kogdata2.Views.Conversations.ShowView extends Backbone.View
  template: JST["backbone/templates/conversations/show"]

  events:
    'submit .message_form': 'updateMessages'

  render: ->
    @form = new Backbone.Form model: new Kogdata2.Models.Message

    $(@el).html @template @model.toJSON()

    .find( '.message_form' ).append(
      $( @form.render().el )
      .append( '<button type="submit">GO</button>' )
    )

    return this

  updateMessages: (e)->
    form = $ e.target

    attrs = {}
    for input in form.serializeArray()
      attrs[ input.name ] = input.value

    @model.get('messages').create attrs, success: =>
      log arguments
      @render()
      return

    return false
