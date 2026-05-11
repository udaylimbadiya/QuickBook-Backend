class ServiceModel {
  final String id;
  final String name;
  final String category;
  final String image;
  final String description;
  final double rating;
  final int reviews;
  final int price;
  final String tag;
  final String location;
  final String openingHours;
  final List<String> gallery;
  final List<String> services;
  final Map<String, dynamic> slots;

  ServiceModel({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.tag,
    required this.location,
    required this.openingHours,
    required this.gallery,
    required this.services,
    required this.slots,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviews: json['reviews'] ?? 0,
      price: json['price'] ?? 0,
      tag: json['tag'] ?? '',
      location: json['location'] ?? '',
      openingHours: json['openingHours'] ?? '',
      gallery: List<String>.from(json['gallery'] ?? []),
      services: List<String>.from(json['services'] ?? []),
      slots: json['slots'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'image': image,
      'description': description,
      'rating': rating,
      'reviews': reviews,
      'price': price,
      'tag': tag,
      'location': location,
      'openingHours': openingHours,
      'gallery': gallery,
      'services': services,
      'slots': slots,
    };
  }
}