import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool isCarousel;
  final List<Widget>? carouselItems;

  const CategoryWidget({
    required Key key,
    required this.title,
    required this.content,
    this.isCarousel = false,
    this.carouselItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          if (isCarousel && carouselItems != null)
            SizedBox(
              height: 200,
              child: CarouselView(
                scrollDirection: Axis.horizontal,
                shrinkExtent: 150,
                itemExtent: 400,
                overlayColor:
                    WidgetStateProperty.all(Colors.black.withOpacity(0.5)),
                children: carouselItems!,
              ),
            ),
          if (!isCarousel)
            Text(
              content,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
        ],
      ),
    );
  }
}
