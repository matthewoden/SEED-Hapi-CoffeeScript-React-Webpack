React = require 'react'
Navigation = require '../components/Navigation'
require '../../style/app.scss'

Root = ({children}) ->
    <div>
      <Navigation/>
      {children}
    </div>

module.exports = Root
