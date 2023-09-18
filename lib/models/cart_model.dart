class CartModel {
  final String? id;
  final String? user;
  final Map<String, dynamic>? jersey;
  final String? league;
  final num? amount;
  final String? size;
  final String? description;
  final num? total;

  CartModel({
    this.id,
    this.user,
    this.jersey,
    this.league,
    this.amount,
    this.size,
    this.description,
    this.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['_id'],
        user: json['user'],
        jersey: json['jersey'],
        league: json['league'],
        amount: json['amount'],
        size: json['size'],
        description: json['description'],
        total: json['total'],
      );
}
