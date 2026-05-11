import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../calendar/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNav = 0;
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _categories = [
    {'icon': '✂️', 'label': 'Salon'},
    {'icon': '💪', 'label': 'Gym'},
    {'icon': '🏥', 'label': 'Clinic'},
    {'icon': '💆', 'label': 'Spa'},
    {'icon': '📚', 'label': 'Tutor'},
    {'icon': '🎭', 'label': 'Events'},
    {'icon': '🐾', 'label': 'Pets'},
  ];

  final List<Map<String, dynamic>> _featured = [
    {
      'name': 'Aurora Salon',
      'type': '✂️  Haircut & Styling',
      'rating': '4.9',
      'reviews': '240',
      'price': '₹499+',
      'badge': '⭐ Top Pick',
      'emoji': '💇‍♀️',
      'bgStart': Color(0xFFFEF3C7),
      'bgEnd': Color(0xFFFDE68A),
      'liked': true,
    },
    {
      'name': 'FitHub Gym',
      'type': '💪  Personal Training',
      'rating': '4.7',
      'reviews': '180',
      'price': '₹799+',
      'badge': '🔥 Trending',
      'emoji': '🏋️',
      'bgStart': Color(0xFFDCFCE7),
      'bgEnd': Color(0xFFBBF7D0),
      'liked': false,
    },
    {
      'name': 'Bliss Spa',
      'type': '💆  Relaxation Massage',
      'rating': '4.8',
      'reviews': '310',
      'price': '₹1299+',
      'badge': '💎 Premium',
      'emoji': '🧖',
      'bgStart': Color(0xFFFEE2E2),
      'bgEnd': Color(0xFFFECACA),
      'liked': false,
    },
  ];

  final List<Map<String, dynamic>> _nearby = [
    {
      'name': 'HealthCare Clinic',
      'type': '🩺  General Checkup',
      'rating': '4.8',
      'dist': '0.8 km',
      'emoji': '🏥',
      'bgStart': Color(0xFFEDE9FE),
      'bgEnd': Color(0xFFDDD6FE),
    },
    {
      'name': 'Style Studio',
      'type': '✂️  Hair & Beauty',
      'rating': '4.5',
      'dist': '1.2 km',
      'emoji': '💇',
      'bgStart': Color(0xFFFEF3C7),
      'bgEnd': Color(0xFFFDE68A),
    },
    {
      'name': 'BrightMind Tutor',
      'type': '📖  Math & Science',
      'rating': '4.9',
      'dist': '2.0 km',
      'emoji': '📚',
      'bgStart': Color(0xFFDCFCE7),
      'bgEnd': Color(0xFFA7F3D0),
    },
  ];

  final List<Map<String, dynamic>> _trending = [
    {'name': 'ZenFlow Yoga', 'cat': 'Wellness • 4.8 ⭐', 'emoji': '🧘', 'bgStart': Color(0xFFE0E7FF), 'bgEnd': Color(0xFFC7D2FE)},
    {'name': 'Luxe Nails', 'cat': 'Beauty • 4.7 ⭐', 'emoji': '💅', 'bgStart': Color(0xFFFCE7F3), 'bgEnd': Color(0xFFFBCFE8)},
    {'name': 'SmileCare Dental', 'cat': 'Clinic • 4.9 ⭐', 'emoji': '🦷', 'bgStart': Color(0xFFD1FAE5), 'bgEnd': Color(0xFFA7F3D0)},
    {'name': 'PawPerfect', 'cat': 'Pets • 4.6 ⭐', 'emoji': '🐕', 'bgStart': Color(0xFFFEF3C7), 'bgEnd': Color(0xFFFDE68A)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // ── TOP NAV BAR ──
                SliverToBoxAdapter(child: _buildNavBar()),

                // ── HERO ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: _buildHero(),
                  ),
                ),

                // ── SEARCH ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: _buildSearch(),
                  ),
                ),

                // ── CATEGORIES ──
                SliverToBoxAdapter(child: _buildSectionHeader('Categories', 'View All')),
                SliverToBoxAdapter(child: _buildCategories()),

                // ── FEATURED ──
                SliverToBoxAdapter(child: _buildSectionHeader('Featured Services', 'View All')),
                SliverToBoxAdapter(child: _buildFeatured()),

                // ── NEARBY ──
                SliverToBoxAdapter(child: _buildSectionHeader('Nearby Services', 'View All')),
                SliverToBoxAdapter(child: _buildNearby()),

                // ── PROMO ──
                SliverToBoxAdapter(child: _buildSectionHeader('Special Offer', '')),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildPromo(),
                  ),
                ),

                // ── TRENDING ──
                SliverToBoxAdapter(child: _buildSectionHeader('Trending Now 🔥', 'View All')),
                SliverToBoxAdapter(child: _buildTrending()),

                // ── UPCOMING BOOKING ──
                SliverToBoxAdapter(child: _buildSectionHeader('Upcoming Booking', 'View All')),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                    child: _buildUpcomingBooking(),
                  ),
                ),
              ],
            ),

            // ── BOTTOM NAV ──
            Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomNav()),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────
  // NAV BAR
  // ─────────────────────────────────────────
  Widget _buildNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        border: Border(bottom: BorderSide(color: AppTheme.purple.withOpacity(0.08))),
      ),
      child: Row(
        children: [
          // Hamburger
          _iconBtn(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (_) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  width: 16,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppTheme.purple,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Logo
          ShaderMask(
            shaderCallback: (b) => AppTheme.primaryGradient.createShader(b),
            child: const Text(
              'QuickBook',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
            ),
          ),
          const Spacer(),
          // Bell
          Stack(
            children: [
              _iconBtn(
                child: const Icon(Icons.notifications_outlined, size: 18, color: AppTheme.purple),
              ),
              Positioned(
                top: 0, right: 0,
                child: Container(
                  width: 16, height: 16,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Text('3', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.w700)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          // Avatar
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.primaryGradient,
              border: Border.all(color: AppTheme.purple, width: 2),
            ),
            child: const Center(
              child: Text('U', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBtn({required Widget child}) {
    return Container(
      width: 36, height: 36,
      decoration: BoxDecoration(color: AppTheme.purpleSoft, borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  // ─────────────────────────────────────────
  // HERO BANNER
  // ─────────────────────────────────────────
  Widget _buildHero() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -40, right: -40,
            child: Container(
              width: 180, height: 180,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)),
            ),
          ),
          Positioned(
            bottom: -30, left: -30,
            child: Container(
              width: 130, height: 130,
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.06)),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tag
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.18),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('⭐', style: TextStyle(fontSize: 11)),
                      SizedBox(width: 4),
                      Text('Premium Booking Platform',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, color: Colors.white, height: 1.25),
                    children: [
                      TextSpan(text: 'Book Your '),
                      TextSpan(text: 'Perfect\n', style: TextStyle(color: Color(0xFFFCD34D))),
                      TextSpan(text: 'Service Today'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Salons • Gyms • Clinics • Spas & More',
                  style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.75)),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.search, size: 13),
                      label: const Text('Explore Now', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppTheme.purple,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        elevation: 4,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: BorderSide(color: Colors.white.withOpacity(0.3)),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                        backgroundColor: Colors.white.withOpacity(0.15),
                      ),
                      child: const Text('How it works', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Floating stats
          Positioned(
            bottom: 16, right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('2.4k+', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                  Text('Services Listed', style: TextStyle(fontSize: 10, color: Colors.white70)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // SEARCH
  // ─────────────────────────────────────────
  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: AppTheme.mutedColor, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search salons, gyms, clinics...',
                hintStyle: TextStyle(fontSize: 13, color: AppTheme.mutedColor, fontFamily: 'Poppins'),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(fontSize: 13, fontFamily: 'Poppins'),
            ),
          ),
          Container(
            width: 34, height: 34,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.tune_rounded, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // SECTION HEADER
  // ─────────────────────────────────────────
  Widget _buildSectionHeader(String title, String action) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppTheme.textColor)),
          if (action.isNotEmpty)
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(action,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppTheme.purple)),
                  const Icon(Icons.chevron_right, size: 14, color: AppTheme.purple),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // CATEGORIES
  // ─────────────────────────────────────────
  Widget _buildCategories() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) {
          final isActive = _selectedCategory == i;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategory = i),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 56, height: 56,
                  decoration: BoxDecoration(
                    gradient: isActive ? AppTheme.primaryGradient : null,
                    color: isActive ? null : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: isActive
                        ? [BoxShadow(color: AppTheme.purple.withOpacity(0.35), blurRadius: 20, offset: const Offset(0, 6))]
                        : [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8)],
                  ),
                  child: Center(child: Text(_categories[i]['icon'], style: const TextStyle(fontSize: 24))),
                ),
                const SizedBox(height: 6),
                Text(
                  _categories[i]['label'],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isActive ? AppTheme.purple : AppTheme.mutedColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────
  // FEATURED SERVICES
  // ─────────────────────────────────────────
  Widget _buildFeatured() {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _featured.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) {
          final f = _featured[i];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: AppTheme.purple.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 6))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 115,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [f['bgStart'] as Color, f['bgEnd'] as Color],
                          ),
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        child: Center(child: Text(f['emoji'], style: const TextStyle(fontSize: 40))),
                      ),
                      Positioned(
                        top: 10, left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(f['badge'], style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white)),
                        ),
                      ),
                      Positioned(
                        top: 10, right: 10,
                        child: Container(
                          width: 28, height: 28,
                          decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              f['liked'] ? Icons.favorite : Icons.favorite_border,
                              size: 14,
                              color: f['liked'] ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(f['name'], style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 3),
                        Text(f['type'], style: const TextStyle(fontSize: 11, color: AppTheme.mutedColor)),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('⭐ ${f['rating']} (${f['reviews']})',
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFF59E0B))),
                            Text(f['price'],
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppTheme.purple)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────
  // NEARBY SERVICES
  // ─────────────────────────────────────────
  Widget _buildNearby() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: _nearby.map((n) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
              ),
              child: Row(
                children: [
                  Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [n['bgStart'] as Color, n['bgEnd'] as Color],
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(child: Text(n['emoji'], style: const TextStyle(fontSize: 28))),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(n['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(n['type'], style: const TextStyle(fontSize: 11, color: AppTheme.mutedColor)),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text('⭐ ${n['rating']}',
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFFF59E0B))),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(color: AppTheme.bgColor, borderRadius: BorderRadius.circular(20)),
                              child: Text('📍 ${n['dist']}',
                                  style: const TextStyle(fontSize: 10, color: AppTheme.mutedColor)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 32, height: 32,
                    decoration: BoxDecoration(color: AppTheme.purpleSoft, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.chevron_right, color: AppTheme.purple, size: 16),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ─────────────────────────────────────────
  // PROMO BANNER
  // ─────────────────────────────────────────
  Widget _buildPromo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.promoGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(top: -20, right: -20,
              child: Container(width: 100, height: 100,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.12)))),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🎉 LIMITED TIME',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white.withOpacity(0.85), letterSpacing: 0.5)),
                    const SizedBox(height: 4),
                    const Text('Get 30% OFF\nFirst Booking!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white, height: 1.2)),
                    const SizedBox(height: 4),
                    Text('Use code: QUICK30',
                        style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.8))),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {Navigator.push(

      context,

      MaterialPageRoute(

        builder: (context) =>
            const CalendarScreen(),

      ),

    );},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFFEF4444),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  elevation: 0,
                ),
                child: const Text('Grab Deal →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // TRENDING
  // ─────────────────────────────────────────
  Widget _buildTrending() {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _trending.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (_, i) {
          final t = _trending[i];
          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
              ),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [t['bgStart'] as Color, t['bgEnd'] as Color],
                      ),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Center(child: Text(t['emoji'], style: const TextStyle(fontSize: 32))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['name'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text(t['cat'], style: const TextStyle(fontSize: 10, color: AppTheme.mutedColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ─────────────────────────────────────────
  // UPCOMING BOOKING CARD
  // ─────────────────────────────────────────
  Widget _buildUpcomingBooking() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: AppTheme.purple.withOpacity(0.35), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(top: -30, right: -30,
              child: Container(width: 120, height: 120,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.08)))),
          Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withOpacity(0.4)),
                ),
                child: const Center(child: Text('✂️', style: TextStyle(fontSize: 28))),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NEXT APPOINTMENT',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white.withOpacity(0.7), letterSpacing: 0.5)),
                    const SizedBox(height: 3),
                    const Text('Aurora Salon',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white)),
                    const SizedBox(height: 2),
                    Text('Haircut & Styling', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8))),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 12, color: Colors.white70),
                        const SizedBox(width: 4),
                        Text('22 May 2025 • 05:30 PM',
                            style: TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.85), fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('✓ Confirmed',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────
  // BOTTOM NAV
  // ─────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        border: Border(top: BorderSide(color: AppTheme.purple.withOpacity(0.1))),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, -4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home_rounded, label: 'Home', index: 0),
          _navItem(icon: Icons.search_rounded, label: 'Search', index: 1),
          // Center FAB
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 52, height: 52,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: AppTheme.purple.withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6))],
              ),
              child: const Icon(Icons.add_rounded, color: Colors.white, size: 26),
            ),
          ),
          _navItem(icon: Icons.calendar_month_rounded, label: 'Calendar', index: 3),
          _navItem(icon: Icons.person_rounded, label: 'Profile', index: 4),
        ],
      ),
    );
  }

  Widget _navItem({required IconData icon, required String label, required int index}) {
    final isActive = _selectedNav == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedNav = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: isActive ? AppTheme.purple : AppTheme.mutedColor),
          const SizedBox(height: 3),
          Text(label,
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isActive ? AppTheme.purple : AppTheme.mutedColor)),
        ],
      ),
    );
  }
}