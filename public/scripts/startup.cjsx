React = require 'react'
ReactDOM = require 'react-dom'
Routes = require './routes'
{ Router, browserHistory } = require 'react-router'
target = document.getElementById('app')

ReactDOM.render(<Router history={browserHistory} routes = { Routes }/>, target)
