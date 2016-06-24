React = require 'react'
NavLink = require './NavLink'
{ Navbar, Nav, NavDropdown, MenuItem } = require 'react-bootstrap'

Navigation = React.createClass
  render:() ->
   <Navbar>
      <Navbar.Header>
        <Navbar.Brand>
          <NavLink to="/">Brand</NavLink>
        </Navbar.Brand>
      </Navbar.Header>
      <Navbar.Collapse>
        <Nav>
          <NavLink to="/feed">Feed</NavLink>
        </Nav>
      </Navbar.Collapse>
    </Navbar>

module.exports = Navigation
