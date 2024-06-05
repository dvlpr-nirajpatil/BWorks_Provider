import 'package:billionworks/consts/app_routes.dart';
import 'package:billionworks/consts/app_theme.dart';
import 'package:billionworks/controller/add_service_controller.dart';
import 'package:billionworks/controller/auth_controller.dart';
import 'package:billionworks/controller/edit_profile_controller.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/controller/handymans_controller.dart';
import 'package:billionworks/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BillionWorksProvider());
}

class BillionWorksProvider extends StatelessWidget {
  const BillionWorksProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddServiceController(),
        ),
        ChangeNotifierProvider(
          create: (_) => FirestoreController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HandymanController(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditProfileController(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: AppTheme.theme,
      ),
    );
  }
}
