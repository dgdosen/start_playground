class App.Views.List extends App.CollectionView
  template: 'list'

  initialize: (options) ->
    super

    @collection.on 'add', @highlightNewView, this
    @selectionModel.on 'select:none', @show, this
    @selectionModel.on 'select', @hide, this

  events: ->
    _.extend super,
      'click a.add': 'showAddMovie'
      'blur #tt_numbers': 'showNumbers'
      'change #dropit' : 'dropping'

  highlightNewView: (model, collection, options) ->
    @getView(model).$el.effect 'highlight', 'slow'

  render: ->
    super
    @addMovie = new App.Views.New
      collection: @collection
      el: @$('#new_movie')
    @addMovie.hide()

  showAddMovie: (event) ->
    event.preventDefault()
    @addMovie.show()

  showNumbers: (event) ->
#    event.preventDefault()
    alert 'showing numbers'

  dropping: (event) ->
    alert 'dropping'