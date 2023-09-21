class OngkirModel {
  final num? value;
  final String? etd;
  final String? note;

  OngkirModel({this.value, this.etd, this.note});

  factory OngkirModel.fromJson(Map<String, dynamic> json) => OngkirModel(
        value: json['value'],
        etd: json['etd'],
        note: json['note'],
      );

  OngkirModel copyWith({
    num? value,
    String? etd,
    String? note,
  }) =>
      OngkirModel(
        value: value ?? this.value,
        etd: etd ?? this.etd,
        note: note ?? this.note,
      );
}
