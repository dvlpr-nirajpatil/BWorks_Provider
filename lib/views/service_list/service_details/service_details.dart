import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/models/service_data_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

class ServiceDetailScreen extends StatefulWidget {
  ServiceDetailScreen({super.key, required this.data});

  static String id = "ServiceDetailScreen";

  ServiceDataModel data;

  @override
  State<ServiceDetailScreen> createState() => _ServiceDetailScreenState();
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.33,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                  widget.data.img!,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -60,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  margin: EdgeInsets.only(left: 18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: AppColors.whiteoColor,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 24),
                                        color: Colors.black.withOpacity(0.09),
                                        blurRadius: 24,
                                      )
                                    ],
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      10.heightBox,
                                      "${widget.data.name}"
                                          .text
                                          .size(18)
                                          .fontFamily(Typo.semiBold)
                                          .make(),
                                      12.heightBox,
                                      Row(
                                        children: [
                                          "₹${widget.data.price}"
                                              .text
                                              .size(18)
                                              .color(AppColors.primary)
                                              .fontFamily(Typo.semiBold)
                                              .make(),
                                          10.widthBox,
                                        ],
                                      ),
                                      18.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Duration : ".text.make(),
                                          Row(
                                            children: [
                                              "${widget.data.time!.hour!} Hour"
                                                  .text
                                                  .make(),
                                              5.widthBox,
                                              "${widget.data.time!.min!} Minutes"
                                                  .text
                                                  .make(),
                                            ],
                                          ),
                                        ],
                                      ),
                                      10.heightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          "Rating: ".text.make(),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color:
                                                    AppColors.activeRatingColor,
                                                size: 20,
                                              ),
                                              4.widthBox,
                                              "4.5".text.make(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 30,
                            top: 60,
                            child: CircleAvatar(),
                          )
                        ],
                      ),
                      100.heightBox,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Description".text.size(18).make(),
                            6.heightBox,
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. "
                                .text
                                .size(12)
                                .color(AppColors.greyTextColor)
                                .make(),
                            14.heightBox,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                14.heightBox,
                Container(
                  decoration: BoxDecoration(color: AppColors.whiteoColor),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 14),
                          color: AppColors.bgColor,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      "Lesile Alexander".text.size(16).make(),
                                      Row(
                                        children: [
                                          VxRating(
                                            onRatingUpdate: (value) {},
                                            value: 3,
                                            selectionColor: AppColors.primary,
                                          ),
                                          4.widthBox,
                                          "4.5".text.make(),
                                        ],
                                      ),
                                    ],
                                  )
                                      .box
                                      .margin(EdgeInsets.only(right: 60))
                                      .make(),
                                  SvgPicture.asset(AssetsUrl.verifiedIcon),
                                ],
                              ),
                              18.heightBox,
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.messageIcon),
                                  10.widthBox,
                                  "Example@gmail.com".text.make(),
                                ],
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.locationIcon),
                                  10.widthBox,
                                  "1901 Thornridge Cir. Shiloh, Hawaii..."
                                      .text
                                      .make(),
                                ],
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.callIcon),
                                  10.widthBox,
                                  "7045550127".text.make(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
