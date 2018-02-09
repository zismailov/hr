class @ScoreCleaner

  constructor: (el) ->
    @el = el
    @inputs = $(@el).find("input")
    @btnClean = $(@el).find("a")
    @_bindEvents()

  _bindEvents: ->
    @btnClean.on "click", (event) =>
      event.preventDefault()
      @inputs.removeAttr("checked")
