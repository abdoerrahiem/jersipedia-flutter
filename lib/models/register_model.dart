class RegisterModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? address;
  final String? province;
  final String? city;
  final bool? isAdmin;

  RegisterModel({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.address,
    this.province,
    this.city,
    this.isAdmin,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'address': address,
      'province': province,
      'city': city,
      'isAdmin': isAdmin,
    };
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? address,
    String? province,
    String? city,
    bool? isAdmin,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      address: address ?? this.address,
      province: province ?? this.province,
      city: city ?? this.city,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
