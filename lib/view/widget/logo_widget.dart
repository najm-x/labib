import 'package:flutter/material.dart';
import 'package:labib/core/constant/image_assets.dart';

class LogoWidget extends StatelessWidget {
const LogoWidget({ super.key, required this.size });
  final double size ;
  @override
  Widget build(BuildContext context){
    return Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const <BoxShadow>[
                    BoxShadow(color: Color.fromARGB(47, 0, 0, 0), blurRadius: 7, offset: Offset(0, 3))
                  ],
                  image: DecorationImage(fit: BoxFit.contain, image: AssetImage(ImageAssets.logo))),
            );
  }
}