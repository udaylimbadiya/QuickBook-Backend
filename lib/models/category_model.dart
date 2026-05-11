class CategoryModel {
  final String id;
  final String name;
  final String? icon;
  final String description;
  final int serviceCount;

  CategoryModel({
    required this.id,
    required this.name,
    this.icon,
    required this.description,
    required this.serviceCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'],
      description: json['description'] ?? '',
      serviceCount: json['serviceCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'description': description,
      'serviceCount': serviceCount,
    };
  }
}
