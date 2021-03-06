import { connect } from 'react-redux';
import { composeTweet } from '../../actions/tweet_actions';
import TweetCompose from './tweets_compose';

const mapStateToProps = (state) => {
  
  // let newTweet;
  // if (state.tweets) {
  //   newTweet = state.tweets.new;
  // } else {
  //   newTweet = ''
  // }
  
  return {
    currentUser: state.session.user,
    newTweet: state.tweets.new
  };
};

const mapDispatchToProps = dispatch => {
  return {
    composeTweet: data => dispatch(composeTweet(data))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(TweetCompose);
