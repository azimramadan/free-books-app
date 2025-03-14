import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class BestDealsItemImage extends StatelessWidget {
  const BestDealsItemImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: screenWidth * 0.25,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
