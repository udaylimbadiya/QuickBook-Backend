class FavoriteModel {
  final String id;
  final String userId;
  final String serviceId;
  final DateTime createdAt;

  FavoriteModel({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.createdAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      serviceId: json['serviceId'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'serviceId': serviceId,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}