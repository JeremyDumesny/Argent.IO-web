import 'package:cutflow/config/theme.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppThemeStyle.poppinsBold(36, AppColor.white),
          ),
          const SizedBox(height: 8.0),
          if (isCarousel && carouselItems != null)
            SizedBox(
              height: 200,
              child: CarouselView(
                backgroundColor: Colors.transparent,
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
              style: AppThemeStyle.poppinsRegular(16, AppColor.white),
            ),
        ],
      ),
    );
  }
}
