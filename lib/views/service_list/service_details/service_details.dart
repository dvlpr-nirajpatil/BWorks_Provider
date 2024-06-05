import 'package:billionworks/consts/images_icons.dart';
import 'package:flutter/material.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  static String id = "ServiceDetailsScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              AssetsUrl.serviceImage,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
