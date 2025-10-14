import 'package:flutter/material.dart';
import 'package:labib/core/constant/image_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: const Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const <BoxShadow>[
            BoxShadow(color: Color.fromARGB(45, 109, 109, 109), blurRadius: 20, offset: Offset(0, 3))
          ],
          image: DecorationImage(fit: BoxFit.contain, image: AssetImage(ImageAssets.logo))),
    );
  }
}
