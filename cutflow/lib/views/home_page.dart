import 'package:cutflow/config/theme.dart';
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
      backgroundColor: const Color(0xFF353535),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 53, 53, 53),
        title: Text('CutFlow',
            style: AppThemeStyle.poppinsBold(24, AppColor.primary)),
        actions: MediaQuery.of(context).size.width >= 600
            ? [
                TextButton(
                  onPressed: () => _scrollToCategory(_category1Key),
                  child: Text("Catégorie 1",
                      style: AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category2Key),
                  child: Text("Jeux",
                      style: AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category3Key),
                  child: Text("Formules",
                      style: AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
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
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                    ),
                    child: Text(
                      'Mon Site Web',
                      style: AppThemeStyle.poppinsSemiBold(24, AppColor.white),
                    ),
                  ),
                  ListTile(
                    title: Text('Catégorie 1',
                        style:
                            AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category1Key);
                    },
                  ),
                  ListTile(
                    title: Text('Jeux',
                        style:
                            AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category2Key);
                    },
                  ),
                  ListTile(
                    title: Text('Formules',
                        style:
                            AppThemeStyle.poppinsSemiBold(16, AppColor.white)),
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
              title: "Nos Jeux",
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          colorFilter: isAvailable == false
              ? ColorFilter.mode(
                  AppColor.primary.withOpacity(0.5), BlendMode.srcOver)
              : null,
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child:
              Text(text, style: AppThemeStyle.poppinsBold(24, AppColor.white))),
    );
  }
}
