class BookingModel {

  final String id;

  final String serviceName;

  final String serviceImage;

  final String location;

  final double price;

  final String date;

  final String time;

  final DateTime createdAt;

  BookingModel({

    required this.id,

    required this.serviceName,

    required this.serviceImage,

    required this.location,

    required this.price,

    required this.date,

    required this.time,

    required this.createdAt,

  });

  /// FROM JSON
  factory BookingModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return BookingModel(

      id: json['_id'] ?? '',

      serviceName:
          json['serviceName'] ?? '',

      serviceImage:
          json['serviceImage'] ?? '',

      location:
          json['location'] ?? '',

      price:
          (json['price'] ?? 0)
              .toDouble(),

      date:
          json['date'] ?? '',

      time:
          json['time'] ?? '',

      createdAt:
          DateTime.parse(
        json['createdAt'] ??
            DateTime.now()
                .toIso8601String(),
      ),

    );

  }

  /// TO JSON
  Map<String, dynamic> toJson() {

    return {

      '_id': id,

      'serviceName':
          serviceName,

      'serviceImage':
          serviceImage,

      'location':
          location,

      'price':
          price,

      'date':
          date,

      'time':
          time,

      'createdAt':
          createdAt.toIso8601String(),

    };

  }

  /// COPY WITH
  BookingModel copyWith({

    String? id,

    String? serviceName,

    String? serviceImage,

    String? location,

    double? price,

    String? date,

    String? time,

    DateTime? createdAt,

  }) {

    return BookingModel(

      id: id ?? this.id,

      serviceName:
          serviceName ??
              this.serviceName,

      serviceImage:
          serviceImage ??
              this.serviceImage,

      location:
          location ??
              this.location,

      price:
          price ?? this.price,

      date:
          date ?? this.date,

      time:
          time ?? this.time,

      createdAt:
          createdAt ??
              this.createdAt,

    );

  }

  @override
  String toString() {

    return '''

BookingModel(

  id: $id,

  serviceName: $serviceName,

  location: $location,

  price: $price,

  date: $date,

  time: $time,

)

''';

  }

}