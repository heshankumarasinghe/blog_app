class AuthUser {
  final int id;
  final String username;
  final String name;
  final bool isAdmin;
  final List<int>? groupIds;

  AuthUser({
    required this.id,
    required this.username,
    required this.name,
    required this.isAdmin,
    this.groupIds,
  });

  AuthUser.fromJson(Map<String, dynamic> json)
      : id = json['user']['id'],
        username = json['user']['username'],
        name = json['user']['name'],
        isAdmin = json['user']['is_admin'] == 1 ? true : false,
        groupIds = List<int>.from(json['user_groups'].map((group) => group['group_id']).toList());
}
