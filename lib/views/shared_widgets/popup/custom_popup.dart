import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

Future<dynamic> customModalPopUp({title, content, context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: content,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title
                      .toString()
                      .text
                      .white
                      .size(16)
                      .fontFamily(Typo.medium)
                      .make(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
