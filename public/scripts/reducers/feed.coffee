merge = require './utils/merge'
{ actions } = require '../actions/feed'
{
  REQUEST_FEED_ENTITIES,
  RECEIVE_FEED_ENTITIES,
  REQUEST_FEED_ENTITIES_FAIL
} = actions

initialState = {
  isFetching: false,
  didInvalidate: false,
  items: null,
}

feed = (state = initialState, action) ->

  switch action.type
    when REQUEST_FEED_ENTITIES
      merge({}, state, {
        isFetching: true
      })
    when RECEIVE_FEED_ENTITIES
      merge({}, state, {
        isFetching: false
        items: action.payload
      })
    when REQUEST_FEED_ENTITIES_FAIL
      merge({}, state, {
        isFetching: false
      })
    else state

module.exports = feed
