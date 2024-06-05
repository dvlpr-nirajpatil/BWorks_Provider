import 'package:billionworks/consts/packages.dart';

Container priceDetailsCard() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
        color: AppColors.greyCardColor,
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Rate"
                .text
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "\$45.00"
                .text
                .fontFamily(Typo.semiBold)
                .color(AppColors.greyTextColor)
                .make(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: AppColors.borderColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Quantity"
                .text
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "*2"
                .text
                .fontFamily(Typo.medium)
                .color(AppColors.greyTextColor)
                .make(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: AppColors.borderColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                "Discount"
                    .text
                    .color(AppColors.textColor)
                    .fontFamily(Typo.medium)
                    .make(),
                5.widthBox,
                "(5% off)"
                    .text
                    .color(AppColors.greenColor)
                    .fontFamily(Typo.medium)
                    .make(),
              ],
            ),
            "-\$23.55"
                .text
                .fontFamily(Typo.medium)
                .color(AppColors.greenColor)
                .make(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: AppColors.borderColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                "Coupon"
                    .text
                    .color(AppColors.textColor)
                    .fontFamily(Typo.medium)
                    .make(),
                5.widthBox,
                "(AB45789A)"
                    .text
                    .color(AppColors.primary)
                    .fontFamily(Typo.medium)
                    .make(),
              ],
            ),
            "\$459"
                .text
                .fontFamily(Typo.medium)
                .color(AppColors.greenColor)
                .make(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: AppColors.borderColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Subtotal"
                .text
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "\$459"
                .text
                .fontFamily(Typo.medium)
                .color(AppColors.greyTextColor)
                .make(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(
            color: AppColors.borderColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "Subtotal"
                .text
                .size(16)
                .color(AppColors.textColor)
                .fontFamily(Typo.semiBold)
                .make(),
            "\$459"
                .text
                .size(16)
                .fontFamily(Typo.semiBold)
                .color(AppColors.primary)
                .make(),
          ],
        ),
      ],
    ),
  );
}
