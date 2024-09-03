import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CutFlow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
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
      Scrollable.ensureVisible(context, duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFA391CB),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFA391CB),
        title: Text('CutFlow'),
        actions: MediaQuery.of(context).size.width >= 600
            ? [
                TextButton(
                  onPressed: () => _scrollToCategory(_category1Key),
                  child: Text("Catégorie 1", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category2Key),
                  child: Text("Jeux", style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () => _scrollToCategory(_category3Key),
                  child: Text("Formules", style: TextStyle(color: Colors.white)),
                ),
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
                    title: Text('Catégorie 1'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category1Key);
                    },
                  ),
                  ListTile(
                    title: Text('Jeux'),
                    onTap: () {
                      Navigator.pop(context);
                      _scrollToCategory(_category2Key);
                    },
                  ),
                  ListTile(
                    title: Text('Formules'),
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
            Category1(
              key: _category1Key,
              title: "Catégorie 1",
              content: "Contenu de la Catégorie 1",
            ),
            Category2(
              key: _category2Key,
              title: "Jeux",
              content: "Contenu de la Catégorie 2",
            ),
            PricingCategorySection(
              key: _category3Key,
            ),
          ],
        ),
      ),
    );
  }
}

class Category1 extends StatelessWidget {
  final String title;
  final String content;

  Category1({
    required Key key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Container(
            height: 200,
            child: CarouselView(
              overlayColor: WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
              shrinkExtent: 150,
              itemExtent: 400,
              onTap: (value) => debugPrint("Carousel item tapped: $value"),
              children: [
                _buildCarouselItem(context, "assets/images/lol.jpg", "League of Legends", isAvalable: true),
                _buildCarouselItem(context, "assets/images/valorant-305kescxw5dpup7y.jpg", "Valorant"),
                _buildCarouselItem(context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context, "assets/images/lol.jpg", "League of Legends"),
                _buildCarouselItem(context, "assets/images/lol.jpg", "League of Legends"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarouselItem(BuildContext context, String path, String text, {bool isAvalable = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          colorFilter:
              isAvalable == false ? ColorFilter.mode(Color(0xFF6C5CE7).withOpacity(0.5), BlendMode.srcOver) : null,
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
          child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      )),
    );
  }
}

class Category2 extends StatelessWidget {
  final String title;
  final String content;
  final bool isCarousel;

  Category2({
    required Key key,
    required this.title,
    required this.content,
    this.isCarousel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PricingCategorySection extends StatefulWidget {
  PricingCategorySection({Key? key}) : super(key: key);

  @override
  _PricingCategorySectionState createState() => _PricingCategorySectionState();
}

class _PricingCategorySectionState extends State<PricingCategorySection> {
  bool _isAnnual = true;

  void _togglePricing() {
    setState(() {
      _isAnnual = !_isAnnual;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Nos Formules",
              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlowText(
                  "Mensuel",
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6C5CE7)),
                ),
                const SizedBox(width: 16.0),
                Switch(
                  value: _isAnnual,
                  onChanged: (value) {
                    setState(() {
                      _isAnnual = value;
                    });
                  },
                ),
                const SizedBox(width: 16.0),
                GlowText(
                  "Annuel",
                  blurRadius: 0,
                  offset: Offset(0, 0),
                  style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6C5CE7)),
                ),
              ],
            ),
          ]),
          SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
          Row(
            children: [
              _buildPricingCard(
                  "Plan Basic", _isAnnual ? 100 : 10, "Le plan de base avec toutes les fonctionnalités essentielles."),
              const SizedBox(width: 16.0),
              _buildPricingCard(
                  "Plan Standard", _isAnnual ? 200 : 20, "Le plan standard avec fonctionnalités supplémentaires.",
                  isFamous: true),
              const SizedBox(width: 16.0),
              _buildPricingCard(
                "Plan Premium",
                _isAnnual ? 300 : 30,
                "Le plan premium avec toutes les fonctionnalités avancées.",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPricingCard(String title, double price, String description, {bool isFamous = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          debugPrint("Pricing card tapped: $title");
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                border: isFamous ? Border.all(color: const Color(0xFF6C5CE7), width: 4) : null,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  title,
                  style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${price.toStringAsFixed(2)} ${_isAnnual ? '€ / an' : '€ / mois'}\n$description",
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            if (isFamous) ...[
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: const Color(0xFF6C5CE7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Populaire",
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
