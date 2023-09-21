class AddOrderModel {
  final List<String>? cart;
  final String? estimation;
  final num? ongkir;
  final num? total;
  final String? courier;

  AddOrderModel(
      {this.cart, this.estimation, this.ongkir, this.total, this.courier});

  Map<String, dynamic> toJson() {
    return {
      'cart': cart,
      'estimation': estimation,
      'ongkir': ongkir,
      'total': total,
      'courier': courier,
    };
  }
}
