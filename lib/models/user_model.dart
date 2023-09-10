class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? province;
  final String? city;
  final bool? isAdmin;
  final String? photo;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.province,
      this.city,
      this.isAdmin,
      this.photo,
      this.createdAt,
      this.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        province: json['province'],
        city: json['city'],
        isAdmin: json['isAdmin'],
        photo: json['photo'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? province,
    String? city,
    bool? isAdmin,
    String? photo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        province: province ?? this.province,
        city: city ?? this.city,
        isAdmin: isAdmin ?? this.isAdmin,
        photo: photo ?? this.photo,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
