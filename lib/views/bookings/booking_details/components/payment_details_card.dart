import 'package:billionworks/consts/packages.dart';

Container paymentDetailsCard() {
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
            "ID".text.color(AppColors.textColor).fontFamily(Typo.medium).make(),
            "#123"
                .text
                .fontFamily(Typo.semiBold)
                .color(AppColors.primary)
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
            "Method"
                .text
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "Cash"
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
            "Status"
                .text
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "Pending"
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
            "\$469"
                .text
                .fontFamily(Typo.medium)
                .color(AppColors.greyTextColor)
                .make(),
          ],
        ),
      ],
    ),
  );
}
