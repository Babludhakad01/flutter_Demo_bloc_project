class MyOrder {
  final String id;
  final String title;
  final String image;
  final String status; // Delivered, Pending
  final double? price;

  final String reason;

  final DateTime date;

  MyOrder({
    required this.id,
    required this.date,
    required this.title,
    required this.image,
    required this.status,
    required this.price,
     this.reason = "",
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) {
    return MyOrder(
      id: json['id'] ?? DateTime.now(),
      title: json['title'] ?? '',
      status: json['status'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      reason: json['reason']?? '',
      date: DateTime.now(),
    );
  }

  // Convert Dart Object -> JSON
  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "status": status,
      "price": price,
      "date": date,
      "reason": reason,
    };
  }

  MyOrder copyWith({
    String? id,
    String? title,
    String? image,
    String? status,
    double? price,
    DateTime? date,
    String? reason,
  }) {
    return MyOrder(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      status: status ?? this.status,
      price: price ?? this.price,
      date: date ?? this.date,
      reason: reason?? this.reason,
    );
  }

  String toString() {
    return 'MyOrder(id: $id, title: $title, status: $status, reason:$reason,  price: $price, date: $date)';
  }
}
