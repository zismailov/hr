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

class @AlertMessage

  constructor: (el) ->
    @scoreFive = $(el).find("input").first()
    @_alertMessage()

  _alertMessage: ->
    @scoreFive.on "click", ->
      alert "Вы точно хотите поставить пять баллов за этот навык?"
