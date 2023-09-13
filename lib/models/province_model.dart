class ProvinceModel {
  final String? provinceId;
  final String? province;

  ProvinceModel({
    this.provinceId,
    this.province,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
        provinceId: json['province_id'],
        province: json['province'],
      );

  ProvinceModel copyWith({
    String? provinceId,
    String? province,
  }) =>
      ProvinceModel(
        provinceId: provinceId ?? this.provinceId,
        province: province ?? this.province,
      );
}
