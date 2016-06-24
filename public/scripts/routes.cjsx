React = require 'react'
{ Route, IndexRoute } = require 'react-router'
Root = require './containers/Root'
Feed = require './containers/Feed'

module.exports = (
  <Route path ="/" component={Root}>
      <Route path="feed" component={Feed}/>
  </Route>
  )
