#= require app/cache
#= require app/view

class App.CollectionView extends App.View

  initialize: (options) ->
    super

    @selector ||= options.selector
    @view ||= options.view

    @viewCache = new App.Cache

    @collection.on 'add', @add, this
    @collection.on 'reset', @reset, this

  add: (model, collection, options) ->
    newView = @getView(model).show()
    if options.index == 0
      @container().prepend newView.$el
    else
      existingModel = @collection.at options.index - 1
      existingView = @getView existingModel
      existingView.$el.after newView.$el

  container: ->
    @_container ||= @_ensureContainer()

  getView: (model) ->
    unless view = @viewCache.get model
      view = @view.apply this, [model]
      @viewCache.add view
    view

  render: ->
    super
    @reset()
    this

  renderContext: ->
    { collection: @collection }

  reset: (collection, options) ->
    @container().html ''
    @collection.each (model) =>
      @container().append @getView(model).show().$el

  _ensureContainer: ->
    if @selector?
      @$(@selector)
    else
      @$el
