import 'package:billionworks/consts/app_info.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/views/auth/login_screen.dart';
import 'package:billionworks/views/dashboard/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String id = "SplashScreen";

  changeScreen(context) {
    var dataController =
        Provider.of<FirestoreController>(context, listen: false);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        FirebaseAuth.instance.userChanges().listen((user) {
          if (user == null) {
            GoRouter.of(context).goNamed(LoginScreen.id);
          } else {
            dataController.fetchAppData();
            GoRouter.of(context).goNamed(DashboardScreen.id);
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    changeScreen(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppInfo.appLogo,
              width: 100,
            ),
            20.heightBox,
            AppInfo.appName.text.fontFamily(Typo.semiBold).size(18).make()
          ],
        ),
      ),
    );
  }
}
