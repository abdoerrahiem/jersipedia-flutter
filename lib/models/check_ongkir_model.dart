class CheckOngkirModel {
  final num? weight;
  final String? courier;

  CheckOngkirModel({this.weight, this.courier});

  Map<String, dynamic> toJson() {
    return {
      'weight': weight,
      'courier': courier,
    };
  }
}
