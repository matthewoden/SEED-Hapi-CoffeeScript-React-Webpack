merge = require './utils/merge'
search = require '../actions/search'
feed = require '../actions/feed'
alerts = require '../actions/alerts'

{ REQUEST_SEARCH_FAIL } = search.actions
{ REQUEST_FEED_ENTITIES_FAIL } = feed.actions
{ DISMISS_ALERT } = alerts.actions

initialState = {
  alerts: [],
}

initialAlertState = {
  title: ''
  style: ''
  message: ''
  actions: []
}

alert = (state = initialAlertState, action) ->
  switch action.type
    when REQUEST_SEARCH_FAIL, REQUEST_FEED_ENTITIES_FAIL
      merge({}, state, {
        title: 'External Request Error',
        message: action.payload.message
        style: 'danger'
      })

    else state

alertList = (state = initialState, action) ->

  switch action.type
    when DISMISS_ALERT
      merge({}, state, {
        alerts: state.alerts.filter (alert, index) -> index != action.index
      })

    when REQUEST_FEED_ENTITIES_FAIL, REQUEST_SEARCH_FAIL
      merge({}, state, {
        alerts: state.alerts.concat(alert(initialAlertState, action))
      })

    else state

module.exports = alertList
