class Order {
  List<OrderItem> items;

  Order({required this.items});
}

class OrderItem {
  String name;
  double? rating;
  String? review;

  OrderItem({required this.name, this.rating, this.review});
}
