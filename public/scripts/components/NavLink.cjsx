React = require 'react'
{ LinkContainer } = require 'react-router-bootstrap'
{ NavItem } = require 'react-bootstrap'
NavLink = (props) ->
  <LinkContainer to={props.to}>
    <NavItem>{props.children}</NavItem>
  </LinkContainer>


module.exports = NavLink
