class CityModel {
  final String? cityId;
  final String? provinceId;
  final String? province;
  final String? type;
  final String? cityName;
  final String? postalCode;

  CityModel({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        cityId: json['city_id'],
        provinceId: json['province_id'],
        province: json['province'],
        type: json['type'],
        cityName: json['city_name'],
        postalCode: json['postal_code'],
      );
}
