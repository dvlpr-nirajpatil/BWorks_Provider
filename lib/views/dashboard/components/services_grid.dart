import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/models/service_data_model.dart';
import 'package:billionworks/views/service_list/service_details/service_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_scroll/text_scroll.dart';

import 'package:velocity_x/velocity_x.dart';

GridView ServicesGrid(cont, List<ServiceDataModel> data, size) {
  return GridView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: data.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: size.height * 0.28,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        crossAxisSpacing: 20),
    itemBuilder: (context, index) => serviceGridTile(cont, data[index]),
  );
}

serviceGridTile(context, ServiceDataModel data) {
  Size size = MediaQuery.of(context).size;
  return GestureDetector(
    onTap: () {
      GoRouter.of(context).goNamed(ServiceDetailScreen.id, extra: data);
    },
    child: Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.serviceCardBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.15,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container().shimmer(),
                  imageUrl: data.img!,
                  fit: BoxFit.fill,
                ),
              ),
              10.heightBox,
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        VxRating(
                          normalColor: Colors.grey.shade300,
                          count: 5,
                          value: 5,
                          selectionColor: AppColors.primary,
                          onRatingUpdate: (value) {},
                        ),
                      ],
                    ),
                    10.heightBox,
                    TextScroll(
                      "${data.name}",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: Typo.medium,
                          color: AppColors.textColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: size.height * 0.13,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.serviceCardBackgroundColor,
            ),
            padding: EdgeInsets.all(3),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.primary,
              ),
              child: "₹${data.price}"
                  .text
                  .color(Colors.white)
                  .size(12)
                  .fontFamily(Typo.semiBold)
                  .make(),
            ),
          ),
        )
      ],
    ),
  );
}
