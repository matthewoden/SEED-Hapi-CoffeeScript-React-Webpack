actions =
  DISMISS_ALERT: 'DISMISS_ALERT'

module.exports =
  actions: actions

  dismissAlertAt: (index) ->
    {
      type: actions.DISMISS_ALERT
      index,
    }
