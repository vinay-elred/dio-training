class UserModel {
  const UserModel({
    required this.name,
    required this.createdAt,
    required this.id,
    required this.avatar,
  });

  final String name;
  final String createdAt;
  final String id;
  final String avatar;
  
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'createdAt': createdAt,
      'id': id,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      createdAt: map['createdAt'] as String,
      id: map['id'] as String,
      avatar: map['avatar'] as String,
    );
  }

}
