#= require app/view

class App.CollectionDetailView extends App.View
  initialize: (options) ->
    super
    @viewCache = new App.Cache

    @view = options.view

    @collection.on 'destroy', @destroy, this
    @selectionModel.on 'select:none', @hideDetail, this
    @selectionModel.on 'select', @showDetail, this

  destroy: (model, collection, options) ->
    @currentView = null if @currentView.model == model

  hideDetail: ->
    @currentView?.hide()

  showDetail: (model) ->
    @currentView?.hide()
    unless view = @viewCache.get(model)
      view = @view.apply this, [model]
      @viewCache.add view
      @$el.append view.render().$el
    @currentView = view
    @currentView.show()
