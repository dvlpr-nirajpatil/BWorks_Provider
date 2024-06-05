import 'package:billionworks/consts/packages.dart';
import 'package:flutter/material.dart';

showCheckStatusModalBottomSheet(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: [
            10.heightBox,
            SizedBox(
              width: 60,
              child: Divider(
                thickness: 4,
                color: AppColors.borderColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Booking History"
                    .text
                    .size(16)
                    .fontFamily(Typo.medium)
                    .color(AppColors.textColor)
                    .make(),
                "ID : #123"
                    .text
                    .fontFamily(Typo.semiBold)
                    .color(AppColors.primary)
                    .make(),
              ],
            ),
            5.heightBox,
            Divider(color: AppColors.borderColor),
            5.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "1:17 PM"
                          .text
                          .size(16)
                          .fontFamily(Typo.medium)
                          .color(AppColors.greyTextColor)
                          .make(),
                      5.heightBox,
                      "6 Feb"
                          .text
                          .fontFamily(Typo.medium)
                          .color(AppColors.textColor)
                          .make()
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.red,
                      ),
                      5.heightBox,
                      Column(
                        children: List.generate(
                          10,
                          (i) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: SizedBox(
                              height: 5,
                              child: VerticalDivider(
                                color: Colors.red,
                                thickness: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                30.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "New Booking"
                          .text
                          .fontFamily(Typo.medium)
                          .size(16)
                          .color(AppColors.textColor)
                          .make(),
                      10.heightBox,
                      "New Booking Added by customer"
                          .text
                          .color(AppColors.greyTextColor)
                          .fontFamily(Typo.medium)
                          .make()
                    ],
                  ),
                )
              ],
            ),
            10.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "1:21 PM"
                          .text
                          .size(16)
                          .fontFamily(Typo.medium)
                          .color(AppColors.greyTextColor)
                          .make(),
                      5.heightBox,
                      "6 Feb"
                          .text
                          .fontFamily(Typo.medium)
                          .color(AppColors.textColor)
                          .make()
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xff00968A),
                      ),
                      5.heightBox,
                      Column(
                        children: List.generate(
                          10,
                          (i) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: SizedBox(
                              height: 5,
                              child: VerticalDivider(
                                color: Color(0xff00968A),
                                thickness: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                30.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Accept Booking"
                          .text
                          .fontFamily(Typo.medium)
                          .size(16)
                          .color(AppColors.textColor)
                          .make(),
                      10.heightBox,
                      "Status changed From pending to accept"
                          .text
                          .color(AppColors.greyTextColor)
                          .fontFamily(Typo.medium)
                          .make()
                    ],
                  ),
                )
              ],
            ),
            10.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "1:22 PM"
                          .text
                          .size(16)
                          .fontFamily(Typo.medium)
                          .color(AppColors.greyTextColor)
                          .make(),
                      5.heightBox,
                      "6 Feb"
                          .text
                          .fontFamily(Typo.medium)
                          .color(AppColors.textColor)
                          .make()
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xffFD6922),
                      ),
                      5.heightBox,
                    ],
                  ),
                ),
                30.widthBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Assigned Booking"
                          .text
                          .fontFamily(Typo.medium)
                          .size(16)
                          .color(AppColors.textColor)
                          .make(),
                      10.heightBox,
                      "Booking has assigned to Naomie Hackett"
                          .text
                          .color(AppColors.greyTextColor)
                          .fontFamily(Typo.medium)
                          .make()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}
