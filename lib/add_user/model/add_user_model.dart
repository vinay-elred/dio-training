class AddUserModel {
  const AddUserModel({
    required this.name,
    required this.createdAt,
    required this.avatar,
  });

  final String name;
  final String createdAt;
  final String avatar;
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'createdAt': createdAt,
      'avatar': avatar,
    };
  }

  factory AddUserModel.fromMap(Map<String, dynamic> map) {
    return AddUserModel(
      name: map['name'] as String,
      createdAt: map['createdAt'] as String,
      avatar: map['avatar'] as String,
    );
  }

}
