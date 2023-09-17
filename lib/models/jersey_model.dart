class JerseyModel {
  final String? id;
  final String? title;
  final Map<String, dynamic>? league;
  final List<dynamic>? images;
  final num? price;
  final String? type;
  final double? weight;
  final num? stock;
  final List<dynamic>? size;

  JerseyModel({
    this.id,
    this.title,
    this.league,
    this.images,
    this.price,
    this.type,
    this.weight,
    this.stock,
    this.size,
  });

  factory JerseyModel.fromJson(Map<String, dynamic> json) => JerseyModel(
        id: json['_id'],
        title: json['title'],
        league: json['league'],
        images: json['images'],
        price: json['price'],
        type: json['type'],
        weight: json['weight'],
        stock: json['stock'],
        size: json['size'],
      );
}
