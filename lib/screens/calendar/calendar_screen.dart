import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'
as http;

import 'package:table_calendar/table_calendar.dart';

import '../../models/booking_model.dart';

class CalendarScreen
    extends StatefulWidget {

  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() =>
      _CalendarScreenState();

}

class _CalendarScreenState
    extends State<CalendarScreen> {

  DateTime selectedDay =
      DateTime.now();

  List<BookingModel> bookings = [];

  List<BookingModel>
      upcomingBookings = [];

  bool isLoading = true;

  final String baseUrl =
      'http://10.180.27.150:5000';

  @override
  void initState() {

    super.initState();

    fetchBookingsByDate();

    fetchUpcomingBookings();

  }

  /// FETCH BOOKINGS BY DATE
  Future<void>
      fetchBookingsByDate() async {

    try {

      final formattedDate =

          '${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}';

      final response =
          await http.get(

        Uri.parse(
          '$baseUrl/api/bookings/date/$formattedDate',
        ),

      );

      final data =
          jsonDecode(response.body);

      if (data['success']) {

        bookings =
            (data['data'] as List)

                .map(
                  (e) =>
                      BookingModel.fromJson(
                    e,
                  ),
                )

                .toList();

      }

      setState(() {

        isLoading = false;

      });

    } catch (e) {

      print(e);

      setState(() {

        isLoading = false;

      });

    }

  }

  /// FETCH UPCOMING BOOKINGS
  Future<void>
      fetchUpcomingBookings() async {

    try {

      final response =
          await http.get(

        Uri.parse(
          '$baseUrl/api/bookings/upcoming',
        ),

      );

      final data =
          jsonDecode(response.body);

      if (data['success']) {

        upcomingBookings =
            (data['data'] as List)

                .map(
                  (e) =>
                      BookingModel.fromJson(
                    e,
                  ),
                )

                .toList();

      }

      setState(() {});

    } catch (e) {

      print(e);

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(

        elevation: 0,

        backgroundColor:
            Theme.of(context).cardColor,

        centerTitle: true,

        title: Text(

          'My Appointments',

          style: TextStyle(

            color: Theme.of(context).cardColor,

            fontWeight:
                FontWeight.bold,

          ),

        ),

      ),

      body: isLoading

          ? const Center(

              child:
                  CircularProgressIndicator(),

            )

          : RefreshIndicator(

              onRefresh: () async {

                await fetchBookingsByDate();

                await fetchUpcomingBookings();

              },

              child: SingleChildScrollView(

                physics:
                    const AlwaysScrollableScrollPhysics(),

                child: Column(

                  children: [

                    const SizedBox(
                      height: 10,
                    ),

                    /// CALENDAR
                    Container(

                      margin:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      decoration: BoxDecoration(

                        color: Theme.of(context).cardColor,

                        borderRadius:
                            BorderRadius.circular(
                          20,
                        ),

                        boxShadow: [

                          BoxShadow(

                            color: Colors.black
                                .withOpacity(
                              0.05,
                            ),

                            blurRadius: 10,

                          ),

                        ],

                      ),

                      child: TableCalendar(

                        focusedDay:
                            selectedDay,

                        firstDay:
                            DateTime(
                          2020,
                        ),

                        lastDay:
                            DateTime(
                          2035,
                        ),

                        selectedDayPredicate:
                            (day) {

                          return isSameDay(
                            selectedDay,
                            day,
                          );

                        },

                        onDaySelected:
                            (
                          selected,
                          focused,
                        ) {

                          setState(() {

                            selectedDay =
                                selected;

                            isLoading = true;

                          });

                          fetchBookingsByDate();

                        },

                        calendarStyle:
                            CalendarStyle(

                          todayDecoration:
                              BoxDecoration(

                            color:
                                Theme.of(context).cardColor,

                            borderRadius:
                                BorderRadius.circular(
                              10,
                            ),

                          ),

                          selectedDecoration:
                              BoxDecoration(

                            color:
                                Colors.orange,

                            borderRadius:
                                BorderRadius.circular(
                              10,
                            ),

                          ),

                        ),

                        headerStyle:
                            const HeaderStyle(

                          formatButtonVisible:
                              false,

                          titleCentered:
                              true,

                        ),

                      ),

                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    /// SELECTED DATE BOOKINGS
                    const Padding(

                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      child: Align(

                        alignment:
                            Alignment.centerLeft,

                        child: Text(

                          'Selected Date Bookings',

                          style: TextStyle(

                            fontSize: 22,

                            fontWeight:
                                FontWeight.bold,

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    bookings.isEmpty

                        ? const Padding(

                            padding:
                                EdgeInsets.all(
                              20,
                            ),

                            child: Text(

                              'No Bookings Found',

                              style: TextStyle(
                                fontSize: 16,
                              ),

                            ),

                          )

                        : ListView.builder(

                            itemCount:
                                bookings.length,

                            shrinkWrap: true,

                            physics:
                                const NeverScrollableScrollPhysics(),

                            itemBuilder:
                                (
                              context,
                              index,
                            ) {

                              final booking =
                                  bookings[
                                      index];

                              return Container(

                                margin:
                                    const EdgeInsets.symmetric(
                                  horizontal:
                                      16,
                                  vertical: 8,
                                ),

                                decoration:
                                    BoxDecoration(

                                  color:
                                      Theme.of(context).cardColor,

                                  borderRadius:
                                      BorderRadius.circular(
                                    20,
                                  ),

                                  boxShadow: [

                                    BoxShadow(

                                      color: Colors
                                          .black
                                          .withOpacity(
                                        0.05,
                                      ),

                                      blurRadius:
                                          10,

                                    ),

                                  ],

                                ),

                                child: ListTile(

                                  contentPadding:
                                      const EdgeInsets.all(
                                    12,
                                  ),

                                  leading:
                                      ClipRRect(

                                    borderRadius:
                                        BorderRadius.circular(
                                      14,
                                    ),

                                    child:
                                        Image.network(

                                      booking
                                          .serviceImage,

                                      width: 70,

                                      height: 70,

                                      fit: BoxFit
                                          .cover,

                                    ),

                                  ),

                                  title: Text(

                                    booking
                                        .serviceName,

                                    style:
                                        const TextStyle(

                                      fontWeight:
                                          FontWeight.bold,

                                    ),

                                  ),

                                  subtitle:
                                      Column(

                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [

                                      const SizedBox(
                                        height: 5,
                                      ),

                                      Text(
                                        booking
                                            .location,
                                      ),

                                      const SizedBox(
                                        height: 4,
                                      ),

                                      Text(
                                        booking
                                            .time,
                                      ),

                                    ],

                                  ),

                                  trailing:
                                      Text(

                                    '₹${booking.price}',

                                    style:
                                        const TextStyle(

                                      fontWeight:
                                          FontWeight.bold,

                                      fontSize:
                                          16,

                                    ),

                                  ),

                                ),

                              );

                            },

                          ),

                    const SizedBox(
                      height: 30,
                    ),

                    /// UPCOMING BOOKINGS
                    const Padding(

                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      child: Align(

                        alignment:
                            Alignment.centerLeft,

                        child: Text(

                          'Upcoming Bookings',

                          style: TextStyle(

                            fontSize: 22,

                            fontWeight:
                                FontWeight.bold,

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ListView.builder(

                      itemCount:
                          upcomingBookings.length,

                      shrinkWrap: true,

                      physics:
                          const NeverScrollableScrollPhysics(),

                      itemBuilder:
                          (
                        context,
                        index,
                      ) {

                        final booking =
                            upcomingBookings[
                                index];

                        return Container(

                          margin:
                              const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),

                          decoration:
                              BoxDecoration(

                            color:
                                Colors.black,

                            borderRadius:
                                BorderRadius.circular(
                              20,
                            ),

                          ),

                          child: ListTile(

                            leading:
                                const Icon(

                              Icons.calendar_month,

                              color:
                                  Colors.white,

                            ),

                            title: Text(

                              booking
                                  .serviceName,

                              style:
                                  const TextStyle(

                                color:
                                    Colors.white,

                                fontWeight:
                                    FontWeight.bold,

                              ),

                            ),

                            subtitle:
                                Text(

                              '${booking.date} • ${booking.time}',

                              style:
                                  const TextStyle(

                                color:
                                    Colors.white70,

                              ),

                            ),

                            trailing:
                                Text(

                              '₹${booking.price}',

                              style:
                                  const TextStyle(

                                color:
                                    Colors.orange,

                                fontWeight:
                                    FontWeight.bold,

                              ),

                            ),

                          ),

                        );

                      },

                    ),

                    const SizedBox(
                      height: 40,
                    ),

                  ],

                ),

              ),

            ),

    );

  }

}