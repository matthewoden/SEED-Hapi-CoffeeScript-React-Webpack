React = require 'react'
{ Route } = require 'react-router'
Root = require './containers/Root'
App = require './containers/App'


module.exports = (
  <Route path="/rebel" component={Root}>
    <Route path="/" component={App}/>
  </Route>
  )
