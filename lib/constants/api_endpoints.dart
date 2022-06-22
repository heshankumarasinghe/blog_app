class ApiEndpoints {
  ApiEndpoints._();

  static const baseUrl = 'https://pm74.paymediasolutions.com/blog/public/api';

  static const login = '/login';
  static const register = '/createUser';
  static const fetchPostsAllGroup = '/fetch_post_all_group';
  static const fetchPostsForGroup = '/fetch_post_single_group';
  static const fetchPollsForGroup = '/fetch_poll_single_group';
  static const addPost = '/createPost';
  static const addPoll = '/create_poll';
  static const getGroupsForUser = '/getGroupsBelongsToUser';
  static const fetchPollResults = '/fech_poll_result';
  static const votePoll = '/vote_poll';
}
