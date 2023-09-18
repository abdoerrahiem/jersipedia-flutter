class AddCartModel {
  final String? jerseyId;
  final num? amount;
  final String? size;
  final String? description;

  AddCartModel({
    this.jerseyId,
    this.amount,
    this.size,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'jerseyId': jerseyId,
      'amount': amount,
      'size': size,
      'description': description,
    };
  }
}
