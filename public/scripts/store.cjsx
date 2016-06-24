{ createStore, applyMiddleware, combineReducers, compose } = require 'redux'
{ apiMiddleware } = require 'redux-api-middleware'
reduxThunk = require('redux-thunk').default

reducer = combineReducers({
  feed: require './reducers/feed'
})

maybeDevtools = if window.devToolsExtension then window.devToolsExtension() else (f) => f
middleware = compose(applyMiddleware(apiMiddleware, reduxThunk), maybeDevtools)
store = createStore(reducer, {}, middleware )

module.exports = store
