import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

dashBoardGrid(FirestoreController controller) {
  return GridView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        mainAxisExtent: 100),
    children: [
      customGridTile(
          icon: AssetsUrl.bookingIcon,
          value: controller.bookingsCount,
          title: "Total Booking"),
      customGridTile(
          icon: AssetsUrl.documentIcon,
          value: controller.services.length,
          title: "Total Services"),
      customGridTile(
          icon: AssetsUrl.usersIcon,
          value: controller.handymansCount,
          title: "Handyman"),
      customGridTile(
          icon: AssetsUrl.bookingIcon, value: "₹3500", title: "Total Earning"),
    ],
  );
}

Container customGridTile({icon, value, title}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      border: Border.all(
        color: AppColors.borderColor,
      ),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "$value"
                  .text
                  .size(22)
                  .color(AppColors.primary)
                  .fontFamily(Typo.semiBold)
                  .make(),
              "$title"
                  .text
                  .color(Color(0xff6C757D))
                  .fontFamily(Typo.medium)
                  .make()
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.lightPurple,
          child: SvgPicture.asset(
            icon,
            color: AppColors.primary,
          ),
        )
      ],
    ),
  );
}
