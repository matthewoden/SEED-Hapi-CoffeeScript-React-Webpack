React = require 'react'
Navigation = require '../components/Navigation'
require '../../style/app.scss'

Root = ({children}) ->
    <div>
      <Navigation/>
      <main className="container">
      {children}
      </main>
    </div>

module.exports = Root
