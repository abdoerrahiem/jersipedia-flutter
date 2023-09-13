class UpdateProfileModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? province;
  final String? city;
  final bool? isAdmin;

  UpdateProfileModel({
    this.name,
    this.email,
    this.phone,
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
      'address': address,
      'province': province,
      'city': city,
      'isAdmin': isAdmin,
    };
  }
}
