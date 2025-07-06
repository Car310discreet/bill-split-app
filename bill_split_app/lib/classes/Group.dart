class Group {
  final String id;
  final String groupName;

  Group({required this.id, required this.groupName});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(id: json['_id'], groupName: json['groupName']);
  }
}
