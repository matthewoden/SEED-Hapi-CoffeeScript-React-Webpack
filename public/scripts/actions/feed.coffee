api = require './utils/api'

actions =
  REQUEST_FEED_ENTITIES: "REQUEST_FEED_ENTITIES"
  RECEIVE_FEED_ENTITIES: "RECEIVE_FEED_ENTITIES"
  REQUEST_FEED_ENTITIES_FAIL: "REQUEST_FEED_ENTITIES_FAIL"

fetchActions = 
  actions: actions

  fetchFeed: () ->
    api
      endpoint: '/api/feed'
      method: 'GET'
      types: [
        actions.REQUEST_FEED_ENTITIES
        actions.RECEIVE_FEED_ENTITIES
        actions.REQUEST_FEED_ENTITIES_FAIL
      ]

  shouldRequestFeed: (state) ->
    feed = state.feed
    if not feed.items
      true
    else if feed.isFetching
      false
    else
      feed.didInvalidate


  fetchFeedIfNeeded: () ->
    (dispatch, getState) =>
      state = getState()
      if @shouldRequestFeed(state)
        dispatch(@fetchFeed())

module.exports = fetchActions
