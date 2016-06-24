React = require 'react'
{ connect } = require 'react-redux'
{ Alert } = require 'react-bootstrap'
{ dismissAlertAt } = require '../actions/alerts'

Alerts = React.createClass
  handleDismisal:(index) ->
    @props.dispatch(dismissAlertAt(index))

  render: () ->
    <div className="alerts container">
      {
        @props.alerts.map (alert, index) =>
          <Alert
            bsStyle={alert.style}
            onDismiss = { (e) => @handleDismisal(index) }
            key = {index}
          >
            <h4>{alert.title}</h4>
            <p>{alert.message}</p>
          </Alert>
      }
    </div>
mapStateToProps = (state) -> state.alerts

module.exports = connect(mapStateToProps)(Alerts)
