import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/service_model.dart';

class ServiceDetailScreen extends StatefulWidget {
  final ServiceModel service;

  const ServiceDetailScreen({
    super.key,
    required this.service,
  });

  @override
  State<ServiceDetailScreen> createState() =>
      _ServiceDetailScreenState();
}

class _ServiceDetailScreenState
    extends State<ServiceDetailScreen> {

  late ServiceModel service;

  DateTime selectedDate =
      DateTime.now();

  String selectedTime =
      '10:00 AM';

  final List<String> availableTimes = [

    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',

  ];

  @override
  void initState() {

    super.initState();

    service = widget.service;

  }

  Future<void> bookAppointment()
  async {

    try {

      await FirebaseFirestore.instance
          .collection('bookings')
          .add({

        'serviceName':
            service.name,

        'serviceImage':
            service.image,

        'location':
            service.location,

        'price':
            service.price,

        'date':
            selectedDate
                .toIso8601String(),

        'time':
            selectedTime,

        'createdAt':
            Timestamp.now(),

      });

      if (!mounted) return;

      showDialog(

        context: context,

        builder: (_) {

          return AlertDialog(

            title: const Text(
              'Success',
            ),

            content: const Text(
              'Appointment Booked Successfully',
            ),

            actions: [

              TextButton(

                onPressed: () {

                  Navigator.pop(
                    context,
                  );

                },

                child: const Text(
                  'OK',
                ),

              ),

            ],

          );

        },

      );

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),

      );

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF8FAFC),

      body: CustomScrollView(

        slivers: [

          /// APP BAR
          SliverAppBar(

            expandedHeight: 320,

            pinned: true,

            backgroundColor:
                const Color(
              0xFF6366F1,
            ),

            flexibleSpace:
                FlexibleSpaceBar(

              background: Hero(

                tag:
                    'service_image_${service.id}',

                child: Image.network(

                  service.image,

                  fit: BoxFit.cover,

                ),

              ),

            ),

          ),

          /// CONTENT
          SliverToBoxAdapter(

            child: Padding(

              padding:
                  const EdgeInsets.all(
                20,
              ),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  /// TITLE
                  Text(

                    service.name,

                    style:
                        const TextStyle(

                      fontSize: 28,

                      fontWeight:
                          FontWeight.bold,

                    ),

                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  /// LOCATION
                  Row(

                    children: [

                      Icon(

                        Icons.location_on,

                        color:
                            Colors.grey[700],

                      ),

                      const SizedBox(
                        width: 6,
                      ),

                      Expanded(

                        child: Text(

                          service.location,

                          style: TextStyle(

                            color:
                                Colors.grey[700],

                            fontSize: 15,

                          ),

                        ),

                      ),

                    ],

                  ),

                  const SizedBox(
                    height: 14,
                  ),

                  /// RATING
                  Row(

                    children: [

                      const Icon(

                        Icons.star,

                        color:
                            Colors.amber,

                      ),

                      const SizedBox(
                        width: 6,
                      ),

                      Text(

                        service.rating
                            .toString(),

                        style:
                            const TextStyle(

                          fontWeight:
                              FontWeight.w600,

                        ),

                      ),

                    ],

                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  /// DESCRIPTION
                  Text(

                    service.description,

                    style: TextStyle(

                      color:
                          Colors.grey[700],

                      height: 1.5,

                    ),

                  ),

                  const SizedBox(
                    height: 28,
                  ),

                  /// PRICE
                  Container(

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration:
                        BoxDecoration(

                      color:
                          Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),

                    ),

                    child: Row(

                      children: [

                        const Text(

                          'Starting at ',

                          style: TextStyle(
                            fontSize: 16,
                          ),

                        ),

                        Text(

                          '₹${service.price}',

                          style:
                              const TextStyle(

                            fontSize: 28,

                            fontWeight:
                                FontWeight.bold,

                            color: Color(
                              0xFF6366F1,
                            ),

                          ),

                        ),

                      ],

                    ),

                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  /// DATE TITLE
                  const Text(

                    'Select Appointment Date',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight:
                          FontWeight.bold,

                    ),

                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  /// DATE PICKER
                  GestureDetector(

                    onTap: () async {

                      final pickedDate =
                          await showDatePicker(

                        context: context,

                        initialDate:
                            selectedDate,

                        firstDate:
                            DateTime.now(),

                        lastDate:
                            DateTime(2030),

                      );

                      if (pickedDate != null) {

                        setState(() {

                          selectedDate =
                              pickedDate;

                        });

                      }

                    },

                    child: Container(

                      padding:
                          const EdgeInsets.all(
                        18,
                      ),

                      decoration:
                          BoxDecoration(

                        color:
                            Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                          18,
                        ),

                        border: Border.all(

                          color:
                              Colors.grey
                                  .shade300,

                        ),

                      ),

                      child: Row(

                        children: [

                          const Icon(

                            Icons.calendar_month,

                            color:
                                Color(
                              0xFF6366F1,
                            ),

                          ),

                          const SizedBox(
                            width: 12,
                          ),

                          Text(

                            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',

                            style:
                                const TextStyle(

                              fontSize: 16,

                              fontWeight:
                                  FontWeight.w600,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  /// TIME TITLE
                  const Text(

                    'Select Time Slot',

                    style: TextStyle(

                      fontSize: 20,

                      fontWeight:
                          FontWeight.bold,

                    ),

                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  /// TIME SLOTS
                  Wrap(

                    spacing: 10,

                    runSpacing: 10,

                    children:
                        availableTimes.map(

                      (time) {

                        final isSelected =
                            selectedTime ==
                                time;

                        return GestureDetector(

                          onTap: () {

                            setState(() {

                              selectedTime =
                                  time;

                            });

                          },

                          child: Container(

                            padding:
                                const EdgeInsets.symmetric(

                              horizontal: 18,

                              vertical: 12,

                            ),

                            decoration:
                                BoxDecoration(

                              color:
                                  isSelected
                                      ? const Color(
                                          0xFF6366F1,
                                        )
                                      : Colors.white,

                              borderRadius:
                                  BorderRadius.circular(
                                14,
                              ),

                              border:
                                  Border.all(

                                color:
                                    isSelected
                                        ? const Color(
                                            0xFF6366F1,
                                          )
                                        : Colors.grey
                                            .shade300,

                              ),

                            ),

                            child: Text(

                              time,

                              style: TextStyle(

                                color:
                                    isSelected
                                        ? Colors.white
                                        : Colors.black87,

                                fontWeight:
                                    FontWeight.w600,

                              ),

                            ),

                          ),

                        );

                      },

                    ).toList(),

                  ),

                  const SizedBox(
                    height: 40,
                  ),

                  /// BOOK BUTTON
                  SizedBox(

                    width: double.infinity,

                    height: 58,

                    child: ElevatedButton(

                      onPressed:
                          bookAppointment,

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            const Color(
                          0xFF6366F1,
                        ),

                        shape:
                            RoundedRectangleBorder(

                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),

                        ),

                      ),

                      child: const Text(

                        'Book Appointment',

                        style: TextStyle(

                          color:
                              Colors.white,

                          fontSize: 17,

                          fontWeight:
                              FontWeight.bold,

                        ),

                      ),

                    ),

                  ),

                  const SizedBox(
                    height: 50,
                  ),

                ],

              ),

            ),

          ),

        ],

      ),

    );

  }

}