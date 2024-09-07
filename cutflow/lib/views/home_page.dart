import 'package:cutflow/controller/auth_controller.dart';
import 'package:cutflow/views/pricing_category_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/category_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _category1Key = GlobalKey();
  final GlobalKey _category2Key = GlobalKey();
  final GlobalKey _category3Key = GlobalKey();

  void _scrollToCategory(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA391CB),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFFA391CB),
        title: const Text('CutFlow'),
        actions: MediaQuery.of(context).size.width >= 600
            ? [
                TextButton(
                  onPressed: () => _scrollToCategory(_category1Key),
                  child: const Text("Catégorie 1",
                      style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category2Key),
                  child:
                      const Text("Jeux", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category3Key),
                  child: const Text("Formules",
                      style: TextStyle(color: Colors.white)),
                ),
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    authController.signOut();
                  },
                )
              ]
            : null,
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF6C5CE7),
                    ),
                    child: Text(
                      'Mon Site Web',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Catégorie 1'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category1Key);
                    },
                  ),
                  ListTile(
                    title: const Text('Jeux'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category2Key);
                    },
                  ),
                  ListTile(
                    title: const Text('Formules'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category3Key);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CategoryWidget(
              key: _category1Key,
              title: "Catégorie 1",
              content: "Contenu de la Catégorie 1",
              isCarousel: true,
            ),
            CategoryWidget(
              key: _category2Key,
              title: "Jeux",
              content: "Contenu de la Catégorie 2",
              isCarousel: true,
              carouselItems: [
                _buildCarouselItem(
                    isAvailable: true,
                    context,
                    "assets/images/lol.jpg",
                    "League of Legends"),
                _buildCarouselItem(context,
                    "assets/images/valorant-305kescxw5dpup7y.jpg", "Valorant"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context,
                    "assets/images/valorant-305kescxw5dpup7y.jpg", "Valorant"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context,
                    "assets/images/valorant-305kescxw5dpup7y.jpg", "Valorant"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context,
                    "assets/images/valorant-305kescxw5dpup7y.jpg", "Valorant"),
                _buildCarouselItem(
                    context, "assets/images/lol.jpg", "League of Legends"),
              ],
            ),
            PricingCategorySection(
              key: _category3Key,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String path, String text,
      {bool isAvailable = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          colorFilter: isAvailable == false
              ? ColorFilter.mode(
                  const Color(0xFF6C5CE7).withOpacity(0.5), BlendMode.srcOver)
              : null,
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}
