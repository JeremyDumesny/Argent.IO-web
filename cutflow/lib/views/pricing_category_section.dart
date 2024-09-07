import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingCategorySection extends StatefulWidget {
  const PricingCategorySection({super.key});

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
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Nos Formules",
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlowText(
                  "Mensuel",
                  blurRadius: 0,
                  offset: const Offset(0, 0),
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6C5CE7)),
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
                  offset: const Offset(0, 0),
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF6C5CE7)),
                ),
              ],
            ),
          ]),
          const SizedBox(height: 16.0),
          Row(
            children: [
              _buildPricingCard("Plan Basic", _isAnnual ? 100 : 10,
                  "Le plan de base avec toutes les fonctionnalités essentielles."),
              const SizedBox(width: 16.0),
              _buildPricingCard("Plan Standard", _isAnnual ? 200 : 20,
                  "Le plan standard avec fonctionnalités supplémentaires.",
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

  Widget _buildPricingCard(String title, double price, String description,
      {bool isFamous = false}) {
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
                border: isFamous
                    ? Border.all(color: const Color(0xFF6C5CE7), width: 4)
                    : null,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
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
