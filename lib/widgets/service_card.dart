import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../screens/service_detail_screen.dart';

class ServiceCard extends StatelessWidget {
final ServiceModel service;
final bool isHero;

const ServiceCard({
super.key,
required this.service,
this.isHero = false,
});

@override
Widget build(BuildContext context) {
return GestureDetector(
onTap: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>
ServiceDetailScreen(
service: service,
),
),
);
},


  child: Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 10,
    ),

    /// BIGGER CARD
    height: 360,

    decoration: BoxDecoration(
      color: Colors.white,

      borderRadius:
          BorderRadius.circular(24),

      boxShadow: [
        BoxShadow(
          color:
              Colors.black.withOpacity(0.08),

          blurRadius: 20,

          offset: const Offset(0, 10),
        ),
      ],
    ),

    child: ClipRRect(
      borderRadius:
          BorderRadius.circular(24),

      /// CHANGED FROM STACK TO COLUMN
      child: Column(
        children: [

          /// IMAGE AREA (2 PART)
          Expanded(
            flex: 2,

            child: Stack(
              children: [

                Positioned.fill(
                  child: isHero
                      ? Hero(
                          tag:
                              'service_image_${service.id}',

                          child: _buildImage(),
                        )
                      : _buildImage(),
                ),

                /// GRADIENT
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(
                        begin:
                            Alignment.topCenter,

                        end:
                            Alignment.bottomCenter,

                        colors: [

                          Colors.transparent,

                          Colors.black
                              .withOpacity(0.15),

                          Colors.black
                              .withOpacity(0.35),

                          Colors.black
                              .withOpacity(0.55),
                        ],
                      ),
                    ),
                  ),
                ),

                /// TAG
                Positioned(
                  top: 16,
                  left: 16,

                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.9),

                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: Text(
                      service.tag,

                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 11,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                /// FAVORITE BUTTON
                Positioned(
                  top: 16,
                  right: 16,

                  child: Container(
                    width: 40,
                    height: 40,

                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.9),

                      shape: BoxShape.circle,
                    ),

                    child: IconButton(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black87,
                        size: 20,
                      ),
                    ),
                  ),
                ),

                /// TITLE ON IMAGE
                Positioned(
                  left: 18,
                  right: 18,
                  bottom: 18,

                  child: Text(
                    service.name,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// DETAIL AREA (1 PART)
          Expanded(
            flex: 1,

            child: Container(
              width: double.infinity,

              padding:
                  const EdgeInsets.all(18),

              color: Colors.white,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  /// CATEGORY + LOCATION
                  Row(
                    children: [

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration:
                            BoxDecoration(
                          color:
                              _getCategoryColor(
                            service.category,
                          ).withOpacity(0.1),

                          borderRadius:
                              BorderRadius.circular(
                            12,
                          ),
                        ),

                        child: Text(
                          service.category,

                          style: TextStyle(
                            color:
                                _getCategoryColor(
                              service.category,
                            ),

                            fontSize: 10,

                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
                      ),

                      const Spacer(),

                      Icon(
                        Icons.location_on,
                        color:
                            Colors.grey[600],
                        size: 14,
                      ),

                      const SizedBox(width: 4),

                      Expanded(
                        child: Text(
                          service.location,

                          maxLines: 1,

                          overflow:
                              TextOverflow
                                  .ellipsis,

                          textAlign:
                              TextAlign.end,

                          style: TextStyle(
                            fontSize: 12,
                            color:
                                Colors.grey[
                                    600],
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// PRICE + RATING + BUTTON
                  Row(
                    children: [

                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                        children: [

                          Text(
                            'Starting at',

                            style: TextStyle(
                              fontSize: 11,
                              color: Colors
                                  .grey[600],
                            ),
                          ),

                          const SizedBox(
                              height: 2),

                          Text(
                            '₹${service.price}',

                            style:
                                const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight
                                      .bold,

                              color:
                                  Color(
                                0xFF6366F1,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        service.rating
                            .toString(),

                        style:
                            const TextStyle(
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),

                        decoration:
                            BoxDecoration(
                          gradient:
                              const LinearGradient(
                            colors: [
                              Color(
                                  0xFF6366F1),
                              Color(
                                  0xFF8B5CF6),
                            ],
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                        ),

                        child: const Text(
                          'Book Now',

                          style: TextStyle(
                            color:
                                Colors.white,

                            fontSize: 12,

                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);


}

Widget _buildImage() {
return Image.network(
service.image,


  fit: BoxFit.cover,

  loadingBuilder:
      (context, child, loadingProgress) {

    if (loadingProgress == null) {
      return child;
    }

    return Container(
      color: Colors.grey[200],

      child: const Center(
        child:
            CircularProgressIndicator(),
      ),
    );
  },

  errorBuilder:
      (context, error, stackTrace) {

    return Container(
      color: Colors.grey[200],

      child: const Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  },
);


}

Color _getCategoryColor(
String category,
) {


switch (category) {

  case 'Hair & Styling':
    return Colors.pink;

  case 'Personal Training':
    return Colors.blue;

  case 'Spa & Massage':
    return Colors.purple;

  case 'Medical Care':
    return Colors.green;

  case 'Home Services':
    return Colors.orange;

  case 'Beauty & Wellness':
    return Colors.red;

  default:
    return Colors.grey;
}


}
}
