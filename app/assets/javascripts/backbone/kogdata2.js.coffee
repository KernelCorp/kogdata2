#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require hamlcoffee

window.Kogdata2 =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

window.Kogdata2.csrfToken = $("meta[name='csrf-token']").attr('content');

Backbone.sync = ((original)->
    return (method, model, options)->
      options.beforeSend = (xhr)->
        xhr.setRequestHeader('X-CSRF-Token', window.Kogdata2.csrfToken)
      original(method, model, options)
    )(Backbone.sync);