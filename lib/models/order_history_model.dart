class OrderHistoryCartModel {
  final String? jerseyId;
  final String? jerseyImage;
  final String? jerseyTitle;
  final num? jerseyPrice;
  final num? amount;
  final num? total;

  OrderHistoryCartModel({
    this.jerseyId,
    this.jerseyImage,
    this.jerseyTitle,
    this.jerseyPrice,
    this.amount,
    this.total,
  });

  factory OrderHistoryCartModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryCartModel(
        jerseyId: json['jerseyId'],
        jerseyImage: json['jerseyImage'],
        jerseyTitle: json['jerseyTitle'],
        jerseyPrice: json['jerseyPrice'],
        amount: json['amount'],
        total: json['total'],
      );
}

class OrderHistoryModel {
  final String? id;
  final String? user;
  final List<OrderHistoryCartModel>? cart;
  final String? paymentLink;
  final String? status;
  final String? estimation;
  final num? ongkir;
  final num? total;
  final String? courier;
  final String? createdAt;

  OrderHistoryModel({
    this.id,
    this.user,
    this.cart,
    this.paymentLink,
    this.status,
    this.estimation,
    this.ongkir,
    this.total,
    this.courier,
    this.createdAt,
  });

  factory OrderHistoryModel.fromJson(Map<String, dynamic> json) =>
      OrderHistoryModel(
        id: json['_id'],
        user: json['user'],
        cart: List<OrderHistoryCartModel>.from(
            json['cart'].map((item) => OrderHistoryCartModel.fromJson(item))),
        paymentLink: json['paymentLink'],
        status: json['status'],
        estimation: json['estimation'],
        ongkir: json['ongkir'],
        total: json['total'],
        courier: json['courier'],
        createdAt: json['createdAt'],
      );
}
