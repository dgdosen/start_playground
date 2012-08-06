class App.Views.Movie extends App.View
  template: 'movie'

  events: ->
    _.extend super,
      'click .name a' : 'showMovie'
      'click #tt_check' : 'showTT'

  showMovie: (event) ->
    event.preventDefault()
    App.router.navigate @model.url(), trigger: true

  showTT: (event) ->
    event.preventDefault()
    alert 'checked'
#    App.router.navigate @model.url(), trigger: true
