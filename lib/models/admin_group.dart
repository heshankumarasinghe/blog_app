class AdminGroup {
  final int id;
  final String groupName;

  AdminGroup({
    required this.id,
    required this.groupName,
  });

  AdminGroup.fromJson(Map<String, dynamic> json)
      : id = json['group_id'],
        groupName = json['group_name'];
}
