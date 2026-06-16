import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/city_model.dart';
import '../widgets/attraction_card.dart';
import '../widgets/food_card.dart';
import '../widgets/route_card.dart';
import '../widgets/ai_content_card.dart';

class CityDetailScreen extends StatefulWidget {
  final CityModel city;
  const CityDetailScreen({super.key, required this.city});

  @override
  State<CityDetailScreen> createState() => _CityDetailScreenState();
}

class _CityDetailScreenState extends State<CityDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> _tabs = ['景点관광 명소', '美食고급 음식', '路线노선', 'AI推荐AI 추천'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final city = widget.city;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: city.themeColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: city.heroImage,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(color: city.themeColor),
                    errorWidget: (_, __, ___) => Container(color: city.themeColor),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          city.themeColor.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              city.name,
                              style: GoogleFonts.notoSansSc(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Text(
                                city.nameEn,
                                style: GoogleFonts.notoSansSc(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16, color: Colors.white70),
                            const SizedBox(width: 4),
                            Text(
                              city.province,
                              style: GoogleFonts.notoSansSc(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          city.description,
                          style: GoogleFonts.notoSansSc(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.85),
                            height: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              labelStyle: GoogleFonts.notoSansSc(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              tabs: _tabs.map((t) => Tab(text: t)).toList(),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAttractionsTab(),
            _buildFoodsTab(),
            _buildRoutesTab(),
            _buildAITab(),
          ],
        ),
      ),
    );
  }

  // ── 景点 Tab ──────────────────────────────
  Widget _buildAttractionsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.city.attractions.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AttractionCard(
          attraction: widget.city.attractions[index],
          themeColor: widget.city.themeColor,
        ),
      ),
    );
  }

  // ── 美食 Tab ──────────────────────────────
  Widget _buildFoodsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.city.foods.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FoodCard(
          food: widget.city.foods[index],
          themeColor: widget.city.themeColor,
        ),
      ),
    );
  }

  // ── 路线 Tab ──────────────────────────────
  Widget _buildRoutesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.city.routes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: RouteCard(
          route: widget.city.routes[index],
          themeColor: widget.city.themeColor,
        ),
      ),
    );
  }

  // ── AI 推荐 Tab ───────────────────────────
  Widget _buildAITab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: AIContentCard(
        aiContent: widget.city.aiContent,
        themeColor: widget.city.themeColor,
        cityName: widget.city.name,
      ),
    );
  }
}
