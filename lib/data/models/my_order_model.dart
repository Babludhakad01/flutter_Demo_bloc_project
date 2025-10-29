class MyOrder {
  final String id;
  final String title;
  final String image;
  final String status; // Delivered, Pending

  final DateTime date;

  MyOrder({
    required this.id,
    required this.date,
    required this.title,
    required this.image,
    required this.status,
  });

  factory MyOrder.fromJson(Map<String, dynamic> json) {
    return MyOrder(
      id: json['id'] ?? DateTime.now(),
      title: json['title'] ?? '',
      status: json['status'] ?? '',
      image: json['image'] ?? '',
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
      "date": date,
    };
  }

  MyOrder copyWith({
    String? id,
    String? title,
    String? image,
    String? status,
    DateTime? date,
  }) {
    return MyOrder(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      status: status ?? this.status,
      date: date ?? this.date,
    );
  }

  String toString() {
    return 'MyOrder(id: $id, title: $title, status: $status, date: $date)';
  }
}
