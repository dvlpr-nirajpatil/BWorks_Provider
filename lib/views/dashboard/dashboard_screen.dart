import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/views/dashboard/components/dashboard_grid.dart';
import 'package:billionworks/views/dashboard/components/services_grid.dart';
import 'package:billionworks/views/service_list/services_list.dart';
import 'package:billionworks/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static String id = "DashboardScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(ProfileScreen.id);
            },
            icon: SvgPicture.asset(
              AssetsUrl.profileIcon,
              color: Colors.white,
              width: 18,
            ),
          )
        ],
        centerTitle: false,
        title: "Home"
            .text
            .textStyle(
              Typo.appBarTitle.copyWith(
                color: Colors.white,
                fontFamily: Typo.medium,
                fontSize: 20,
              ),
            )
            .make(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.heightBox,
              Consumer<FirestoreController>(
                builder: (context, controller, xxx) {
                  print(controller.servicesCount);
                  return dashBoardGrid(controller);
                },
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Services".text.size(18).fontFamily(Typo.medium).make(),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(ServicesList.id);
                    },
                    child: "View All"
                        .text
                        .fontFamily(Typo.medium)
                        .color(Color(0xff6C757D))
                        .make(),
                  ),
                ],
              ),
              20.heightBox,
              Consumer<FirestoreController>(
                  builder: (context, controller, xxx) {
                return ServicesGrid(
                    context, controller.services, MediaQuery.of(context).size);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
