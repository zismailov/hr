class @AlertMessage

  constructor: (el) ->
    @scoreFive = $(el).find("input[value=5]").first()
    @_alertMessage()

  _alertMessage: ->
    @scoreFive.on "click", ->
      alert "Выбор 5-ти баллов означает, что уровень владения данным навыком превосходит ожидания! " +
            "Вы уверены, что хотите поставить 5 баллов?"
