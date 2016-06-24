React = require 'react'
ReactDOM = require 'react-dom'
{ Router, browserHistory } = require 'react-router'
{ Provider } = require 'react-redux'

store = require './store'
Routes = require './routes'

target = document.getElementById('app')

component =
  <Provider store = store>
    <Router history={browserHistory} routes = { Routes }/>
  </Provider>

ReactDOM.render(component, target)
