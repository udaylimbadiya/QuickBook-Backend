import 'package:flutter/material.dart';

import '../../data/demo_services.dart';

import '../../widgets/glass_card.dart';

import '../../widgets/service_card.dart';

import '../search/search_screen.dart';

class HomeScreen
    extends StatefulWidget {

  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();

}

class _HomeScreenState
    extends State<HomeScreen>
    with TickerProviderStateMixin {

  late AnimationController
      _heroAnimationController;

  late Animation<double>
      _heroAnimation;

  final TextEditingController
      searchController =
          TextEditingController();

  String selectedCategory =
      '';

  @override
  void initState() {

    super.initState();

    _heroAnimationController =
        AnimationController(

      duration:
          const Duration(
        milliseconds: 800,
      ),

      vsync: this,

    );

    _heroAnimation =
        Tween<double>(

      begin: 0,

      end: 1,

    ).animate(

      CurvedAnimation(

        parent:
            _heroAnimationController,

        curve:
            Curves.easeOutCubic,

      ),

    );

    _heroAnimationController
        .forward();

  }

  @override
  void dispose() {

    _heroAnimationController
        .dispose();

    searchController.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    final filteredServices =
        demoServices.where((service) {

      if (selectedCategory
          .isEmpty) {

        return true;

      }

      return service.category

          .toLowerCase()

          .contains(

            selectedCategory
                .toLowerCase(),

          );

    }).toList();

    return Scaffold(

      backgroundColor:
          Theme.of(context)
              .scaffoldBackgroundColor,

      body: SafeArea(

        child: CustomScrollView(

          physics:
              const BouncingScrollPhysics(),

          slivers: [

            /// HERO BANNER
            SliverToBoxAdapter(

              child:
                  AnimatedBuilder(

                animation:
                    _heroAnimation,

                builder:
                    (
                  context,
                  child,
                ) {

                  return Transform.translate(

                    offset: Offset(

                      0,

                      40 *

                          (1 -
                              _heroAnimation
                                  .value),

                    ),

                    child:
                        Opacity(

                      opacity:
                          _heroAnimation
                              .value,

                      child:
                          _buildHeroBanner(),

                    ),

                  );

                },

              ),

            ),

            /// CATEGORY
            SliverToBoxAdapter(

              child:
                  _buildCategoriesSection(),

            ),

            /// SEARCH BAR
            SliverToBoxAdapter(

              child: Padding(

                padding:
                    const EdgeInsets.fromLTRB(

                  20,
                  20,
                  20,
                  12,

                ),

                child: Row(

                  children: [

                    Expanded(

                      child: Container(

                        decoration:
                            BoxDecoration(

                          color:
                              Theme.of(context)
                                  .cardColor,

                          borderRadius:
                              BorderRadius.circular(
                            16,
                          ),

                        ),

                        child: TextField(

                          controller:
                              searchController,

                          style: TextStyle(

                            color:
                                Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,

                          ),

                          onChanged:
                              (value) {

                            setState(() {

                              selectedCategory =
                                  value;

                            });

                          },

                          decoration:
                              InputDecoration(

                            hintText:
                                'Search services...',

                            hintStyle:
                                TextStyle(

                              color:
                                  Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,

                            ),

                            prefixIcon:
                                Icon(

                              Icons.search,

                              color:
                                  Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,

                            ),

                            border:
                                InputBorder.none,

                            contentPadding:
                                const EdgeInsets.symmetric(

                              horizontal: 16,

                              vertical: 16,

                            ),

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(
                      width: 12,
                    ),

                    /// FILTER BUTTON
                    Container(

                      width: 56,

                      height: 56,

                      decoration:
                          BoxDecoration(

                        borderRadius:
                            BorderRadius.circular(
                          16,
                        ),

                        gradient:
                            const LinearGradient(

                          colors: [

                            Color(
                              0xff5DADE2,
                            ),

                            Color(
                              0xff34495E,
                            ),

                          ],

                        ),

                      ),

                      child: const Icon(

                        Icons.tune,

                        color:
                            Colors.white,

                      ),

                    ),

                  ],

                ),

              ),

            ),

            /// FEATURE TITLE
            SliverToBoxAdapter(

              child: Padding(

                padding:
                    const EdgeInsets.fromLTRB(

                  20,
                  12,
                  20,
                  16,

                ),

                child: Text(

                  'Featured Services',

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

              ),

            ),

            /// SERVICES
            SliverList(

              delegate:
                  SliverChildBuilderDelegate(

                (
                  context,
                  index,
                ) {

                  final service =
                      filteredServices[
                          index];

                  return Padding(

                    padding:
                        const EdgeInsets.symmetric(

                      horizontal: 16,

                      vertical: 6,

                    ),

                    child:
                        ServiceCard(

                      service:
                          service,

                      isHero:
                          index == 0,

                    ),

                  );

                },

                childCount:
                    filteredServices
                        .length,

              ),

            ),

            const SliverToBoxAdapter(

              child: SizedBox(
                height: 30,
              ),

            ),

          ],

        ),

      ),

    );

  }

  /// HERO BANNER
  Widget _buildHeroBanner() {

    return Container(

      margin:
          const EdgeInsets.all(
        20,
      ),

      height:
          MediaQuery.of(context)
                  .size
                  .height *
              0.26,

      decoration:
          BoxDecoration(

        borderRadius:
            BorderRadius.circular(
          30,
        ),

        gradient:
            const LinearGradient(

          begin:
              Alignment.topLeft,

          end:
              Alignment.bottomRight,

          colors: [

            Color(
              0xff5DADE2,
            ),

            Color(
              0xff34495E,
            ),

          ],

        ),

        boxShadow: [

          BoxShadow(

            color:
                const Color(
              0xff5DADE2,
            ).withOpacity(
              0.25,
            ),

            blurRadius: 20,

            offset:
                const Offset(
              0,
              10,
            ),

          ),

        ],

      ),

      child: Stack(

        children: [

          Positioned.fill(

            child: ClipRRect(

              borderRadius:
                  BorderRadius.circular(
                30,
              ),

              child: Opacity(

                opacity: 0.12,

                child:
                    Image.network(

                  'https://images.unsplash.com/photo-1559599101-f09722fb4948?w=400',

                  fit:
                      BoxFit.cover,

                ),

              ),

            ),

          ),

          Padding(

            padding:
                const EdgeInsets.all(
              24,
            ),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                const Text(

                  'QuickBook',

                  style: TextStyle(

                    color:
                        Colors.white,

                    fontSize: 32,

                    fontWeight:
                        FontWeight.bold,

                  ),

                ),

                const SizedBox(
                  height: 8,
                ),

                const Text(

                  'Book Premium Services',

                  style: TextStyle(

                    color:
                        Colors.white,

                    fontSize: 20,

                    fontWeight:
                        FontWeight.w600,

                  ),

                ),

                const SizedBox(
                  height: 6,
                ),

                Text(

                  'Salon • Spa • Gym • Clinic',

                  style: TextStyle(

                    color:
                        Colors.white
                            .withOpacity(
                      0.9,
                    ),

                  ),

                ),

                const Spacer(),

                GestureDetector(

                  onTap: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            const SearchScreen(),

                      ),

                    );

                  },

                  child: GlassCard(

                    child: Container(

                      padding:
                          const EdgeInsets.symmetric(

                        horizontal: 18,

                        vertical: 15,

                      ),

                      child: Row(

                        children: [

                          const Icon(

                            Icons.search,

                            color:
                                Colors.white,

                          ),

                          const SizedBox(
                            width: 12,
                          ),

                          Text(

                            'Search services...',

                            style:
                                TextStyle(

                              color:
                                  Colors.white
                                      .withOpacity(
                                0.9,
                              ),

                              fontSize:
                                  16,

                            ),

                          ),

                        ],

                      ),

                    ),

                  ),

                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

  /// CATEGORY SECTION
  Widget _buildCategoriesSection() {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Padding(

          padding:
              const EdgeInsets.symmetric(
            horizontal: 20,
          ),

          child: Text(

            'Categories',

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

        ),

        const SizedBox(
          height: 18,
        ),

        SizedBox(

          height: 120,

          child: ListView.builder(

            scrollDirection:
                Axis.horizontal,

            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            itemCount:
                categories.length,

            itemBuilder:
                (
              context,
              index,
            ) {

              final category =
                  categories[index];

              return _buildCategoryCard(
                category,
                index,
              );

            },

          ),

        ),

      ],

    );

  }

  /// CATEGORY CARD
  Widget _buildCategoryCard(

    String category,

    int index,

  ) {

    final colors = [

      [Colors.pink, Colors.pinkAccent],

      [Colors.blue, Colors.blueAccent],

      [Colors.purple, Colors.purpleAccent],

      [Colors.green, Colors.greenAccent],

      [Colors.orange, Colors.orangeAccent],

      [Colors.red, Colors.redAccent],

    ];

    final icons = [

      Icons.content_cut,

      Icons.fitness_center,

      Icons.spa,

      Icons.local_hospital,

      Icons.home_repair_service,

      Icons.face,

    ];

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedCategory =
              category;

          searchController.text =
              category;

        });

      },

      child: Container(

        width: 100,

        margin:
            const EdgeInsets.only(
          right: 16,
        ),

        child: Column(

          children: [

            Container(

              width: 72,

              height: 72,

              decoration:
                  BoxDecoration(

                gradient:
                    LinearGradient(

                  colors:
                      colors[index %
                          colors.length],

                  begin:
                      Alignment.topLeft,

                  end: Alignment
                      .bottomRight,

                ),

                borderRadius:
                    BorderRadius.circular(
                  22,
                ),

                boxShadow: [

                  BoxShadow(

                    color:
                        colors[index %
                                colors.length][0]
                            .withOpacity(
                      0.30,
                    ),

                    blurRadius: 12,

                    offset:
                        const Offset(
                      0,
                      6,
                    ),

                  ),

                ],

              ),

              child: Icon(

                icons[index %
                    icons.length],

                color:
                    Colors.white,

                size: 32,

              ),

            ),

            const SizedBox(
              height: 10,
            ),

            Text(

              category,

              textAlign:
                  TextAlign.center,

              maxLines: 2,

              style: TextStyle(

                fontSize: 12,

                fontWeight:
                    FontWeight.w600,

                color:
                    Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color,

              ),

            ),

          ],

        ),

      ),

    );

  }

}