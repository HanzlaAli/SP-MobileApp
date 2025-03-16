import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/Constants/MyColors.dart';

class MyNetworkImage extends StatelessWidget {
  MyNetworkImage({super.key, required this.imagePath, this.fit,this.height,this.width});
  String imagePath;
  BoxFit? fit;
  double? height, width;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: imagePath,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: kBlackColor26,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: kSecondaryColor,
        ),
      ),
      height: height,
      width: width,
    );
  }
}
