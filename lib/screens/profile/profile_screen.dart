import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/booking_model.dart';
import '../../providers/theme_provider.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() =>
      _ProfileScreenState();

}

class _ProfileScreenState
    extends State<ProfileScreen> {

  File? profileImage;

  List<BookingModel>
      bookingHistory = [];

  bool showHistory = false;

  bool showFavorites = false;

  bool isLoading = true;

  final String baseUrl =
      'http://10.180.27.150:5000';

  @override
  void initState() {

    super.initState();

    loadProfileImage();

    fetchBookings();

  }

  /// LOAD IMAGE
  Future<void>
      loadProfileImage() async {

    final prefs =
        await SharedPreferences
            .getInstance();

    final imagePath =
        prefs.getString(
      'profile_image',
    );

    if (imagePath != null) {

      setState(() {

        profileImage =
            File(imagePath);

      });

    }

  }

  /// PICK IMAGE
  Future<void>
      pickProfileImage() async {

    final picked =
        await ImagePicker().pickImage(

      source: ImageSource.gallery,

      imageQuality: 70,

    );

    if (picked != null) {

      final prefs =
          await SharedPreferences
              .getInstance();

      await prefs.setString(
        'profile_image',
        picked.path,
      );

      setState(() {

        profileImage =
            File(picked.path);

      });

    }

  }

  /// FETCH BOOKINGS
  Future<void>
      fetchBookings() async {

    try {

      final response =
          await http.get(

        Uri.parse(
          '$baseUrl/api/bookings',
        ),

      );

      final data =
          jsonDecode(response.body);

      if (data['success']) {

        bookingHistory =
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

  @override
  Widget build(BuildContext context) {

    final themeProvider =
        Provider.of<ThemeProvider>(
      context,
    );

    return Scaffold(

      backgroundColor:
          Theme.of(context)
              .scaffoldBackgroundColor,

      body: isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : SafeArea(

              child:
                  SingleChildScrollView(

                child: Padding(

                  padding:
                      const EdgeInsets.all(
                    16,
                  ),

                  child: Column(

                    children: [

                      /// TITLE
                      Align(

                        alignment:
                            Alignment.centerLeft,

                        child: Text(

                          'Profile',

                          style: TextStyle(

                            fontSize: 30,

                            fontWeight:
                                FontWeight.bold,

                            color:
                                Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,

                          ),

                        ),

                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      /// PROFILE CARD
                      Container(

                        width:
                            double.infinity,

                        padding:
                            const EdgeInsets.all(
                          24,
                        ),

                        decoration:
                            BoxDecoration(

                          color:
                              Theme.of(context)
                                  .cardColor,

                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),

                        ),

                        child: Column(

                          children: [

                            /// PROFILE IMAGE
                            Stack(

                              children: [

                                CircleAvatar(

                                  radius: 55,

                                  backgroundImage:
                                      profileImage !=
                                              null

                                          ? FileImage(
                                              profileImage!,
                                            )

                                          : const NetworkImage(
                                              'https://i.pravatar.cc/300',
                                            ) as ImageProvider,

                                ),

                                Positioned(

                                  bottom: 0,

                                  right: 0,

                                  child:
                                      GestureDetector(

                                    onTap:
                                        pickProfileImage,

                                    child: Container(

                                      padding:
                                          const EdgeInsets.all(
                                        8,
                                      ),

                                      decoration:
                                          BoxDecoration(

                                        color:
                                            Theme.of(context)
                                                .primaryColor,

                                        shape:
                                            BoxShape.circle,

                                      ),

                                      child:
                                          const Icon(

                                        Icons.edit,

                                        color:
                                            Colors.white,

                                        size: 18,

                                      ),

                                    ),

                                  ),

                                ),

                              ],

                            ),

                            const SizedBox(
                              height: 18,
                            ),

                            /// USER NAME
                            Text(

                              'Uday Limbadiya',

                              style: TextStyle(

                                fontSize: 24,

                                fontWeight:
                                    FontWeight.bold,

                                color:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,

                              ),

                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            /// PREMIUM MEMBER
                            Container(

                              padding:
                                  const EdgeInsets.symmetric(

                                horizontal: 18,

                                vertical: 10,

                              ),

                              decoration:
                                  BoxDecoration(

                                color:
                                    Theme.of(context)
                                        .primaryColor,

                                borderRadius:
                                    BorderRadius.circular(
                                  30,
                                ),

                              ),

                              child: Row(

                                mainAxisSize:
                                    MainAxisSize.min,

                                children: [

                                  const Icon(

                                    Icons.workspace_premium,

                                    color:
                                        Colors.white,

                                  ),

                                  const SizedBox(
                                    width: 8,
                                  ),

                                  const Text(

                                    'Premium Member',

                                    style: TextStyle(

                                      color:
                                          Colors.white,

                                      fontWeight:
                                          FontWeight.bold,

                                    ),

                                  ),

                                ],

                              ),

                            ),

                          ],

                        ),

                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      /// FAVORITES
                      buildButton(

                        icon:
                            Icons.favorite,

                        title:
                            'Favorites',

                        onTap: () {

                          setState(() {

                            showFavorites =
                                !showFavorites;

                          });

                        },

                      ),

                      if (showFavorites)

                        buildExpandCard(

                          child: const Padding(

                            padding:
                                EdgeInsets.all(
                              20,
                            ),

                            child: Center(

                              child: Text(

                                'Favorite cards show here',

                              ),

                            ),

                          ),

                        ),

                      const SizedBox(
                        height: 14,
                      ),

                      /// HISTORY
                      buildButton(

                        icon:
                            Icons.history,

                        title:
                            'Booking History',

                        onTap: () {

                          setState(() {

                            showHistory =
                                !showHistory;

                          });

                        },

                      ),

                      if (showHistory)

                        buildExpandCard(

                          child: ListView.builder(

                            itemCount:
                                bookingHistory
                                    .length,

                            shrinkWrap: true,

                            physics:
                                const NeverScrollableScrollPhysics(),

                            itemBuilder:
                                (
                              context,
                              index,
                            ) {

                              final booking =
                                  bookingHistory[
                                      index];

                              return ListTile(

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

                                    width: 60,

                                    height: 60,

                                    fit:
                                        BoxFit.cover,

                                  ),

                                ),

                                title: Text(
                                  booking
                                      .serviceName,
                                ),

                                subtitle:
                                    Column(

                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,

                                  children: [

                                    Text(
                                      booking
                                          .date,
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

                                    color:
                                        Colors.orange,

                                  ),

                                ),

                              );

                            },

                          ),

                        ),

                      const SizedBox(
                        height: 14,
                      ),

                      /// SETTINGS
                      buildButton(

                        icon:
                            Icons.settings,

                        title:
                            'Settings',

                        onTap: () {

                          showModalBottomSheet(

                            context: context,

                            backgroundColor:
                                Theme.of(context)
                                    .cardColor,

                            shape:
                                const RoundedRectangleBorder(

                              borderRadius:
                                  BorderRadius.vertical(

                                top:
                                    Radius.circular(
                                  30,
                                ),

                              ),

                            ),

                            builder: (_) {

                              return Padding(

                                padding:
                                    const EdgeInsets.all(
                                  20,
                                ),

                                child: Column(

                                  mainAxisSize:
                                      MainAxisSize.min,

                                  children: [

                                    SwitchListTile(

                                      value:
                                          themeProvider
                                              .isDarkMode,

                                      onChanged:
                                          (value) {

                                        themeProvider
                                            .toggleTheme();

                                      },

                                      secondary:
                                          const Icon(
                                        Icons.dark_mode,
                                      ),

                                      title:
                                          const Text(
                                        'Dark Mode',
                                      ),

                                    ),

                                    const Divider(),

                                    const ListTile(

                                      leading:
                                          Icon(
                                        Icons.info,
                                      ),

                                      title:
                                          Text(
                                        'Version',
                                      ),

                                      subtitle:
                                          Text(
                                        'QuickBook v1.0.0',
                                      ),

                                    ),

                                  ],

                                ),

                              );

                            },

                          );

                        },

                      ),

                      const SizedBox(
                        height: 14,
                      ),

                      /// LOGOUT
                      buildButton(

                        icon:
                            Icons.logout,

                        title:
                            'Logout',

                        onTap: () {

                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(

                            const SnackBar(

                              content: Text(
                                'Logged Out',
                              ),

                            ),

                          );

                        },

                      ),

                    ],

                  ),

                ),

              ),

            ),

    );

  }

  /// BUTTON
  Widget buildButton({

    required IconData icon,

    required String title,

    required VoidCallback onTap,

  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding:
            const EdgeInsets.all(
          18,
        ),

        decoration:
            BoxDecoration(

          color:
              Theme.of(context)
                  .cardColor,

          borderRadius:
              BorderRadius.circular(
            22,
          ),

        ),

        child: Row(

          children: [

            Icon(

              icon,

              color:
                  Theme.of(context)
                      .primaryColor,

            ),

            const SizedBox(
              width: 16,
            ),

            Expanded(

              child: Text(

                title,

                style: TextStyle(

                  fontSize: 18,

                  fontWeight:
                      FontWeight.bold,

                  color:
                      Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color,

                ),

              ),

            ),

            Icon(

              Icons.arrow_forward_ios,

              size: 18,

              color:
                  Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .color,

            ),

          ],

        ),

      ),

    );

  }

  /// EXPAND CARD
  Widget buildExpandCard({

    required Widget child,

  }) {

    return Container(

      width: double.infinity,

      margin:
          const EdgeInsets.only(
        top: 10,
      ),

      padding:
          const EdgeInsets.all(
        12,
      ),

      decoration:
          BoxDecoration(

        color:
            Theme.of(context)
                .cardColor,

        borderRadius:
            BorderRadius.circular(
          22,
        ),

      ),

      child: child,

    );

  }

}