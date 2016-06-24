React = require 'react'
{ connect } = require 'react-redux'
actions = require '../actions/feed'

Feed = React.createClass
  componentWillMount: () ->
    { dispatch } = this.props
    dispatch(actions.fetchFeedIfNeeded())

  render: ()->
    <div>
    <h1> User Posts </h1>
     {
       this.props.items?.map (item, itemIndex) ->
         <div key ={ itemIndex }>
           <h2 >
            {item.name} <span className="text-muted">({item.username})</span>
           </h2>
           <h3>Posts</h3>
           <div>
             { item.posts.map (post, postIndex) ->
               <div>
                 <h4 key={postIndex}>
                  {post.sentence}
                  </h4>
                 <p>{post.paragraph}</p>
               </div>
             }
           </div>
         </div>
     }
    </div>

mapStateToProps = (state) =>
  { feed } = state
  feed

module.exports = connect(mapStateToProps)(Feed)
