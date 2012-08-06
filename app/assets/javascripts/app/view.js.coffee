class App.View extends Backbone.View
  initialize: (options) ->
    @template ||= options.template
    @presenter ||= options.presenter
    @selectionModel = options.selectionModel

  destroy: ->
    @hide()
    @undelegateEvents()
    @unbind()
    @$el.remove()
    this

  events: ->
    {}

  hide: ->
    @$el.hide()
    this

  html: (html) ->
    @$el.html html
    this

  render: ->
    @_rendered = true
    if @template?
      @html @renderTemplate(@template, @renderContext(), @renderPartials())
    this

  renderContext: ->
    if @presenter?
      @presenter.apply this, [@model]
    else if @model?
      @model.toJSON()
    else
      {}

  renderPartials: ->
    {}

  renderTemplate: (template, context, partials) ->
    @_template(template).render context, partials

  show: ->
    @render() unless @_rendered?
    @$el.show()
    this

  unbind: ->
    # TODO
    # events bindings are handled by undelegateEvents()
    # undo other bindings (for example to models or jQuery)

  _template: (template) ->
    HoganTemplates['templates/' + template]
