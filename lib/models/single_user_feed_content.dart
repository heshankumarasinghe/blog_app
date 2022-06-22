class SingleUserFeedContent {
  final int id;
  final int groupId;
  final String userImageUrl;
  final String username;
  final String? feedImageUrl;
  final String feedDescription;
  final int likesCount;

  SingleUserFeedContent({
    required this.id,
    required this.groupId,
    required this.userImageUrl,
    required this.username,
    required this.feedImageUrl,
    required this.feedDescription,
    required this.likesCount,
  });

  SingleUserFeedContent.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        groupId = json['groupId'],
        userImageUrl = 'https://xsgames.co/randomusers/assets/avatars/female/70.jpg',
        username = 'Jane',
        feedImageUrl = json['imageURL'],
        feedDescription = json['postDescription'],
        likesCount = 5;
}
