import 'package:billionworks/consts/packages.dart';

Container handymanListCard() {
  return Container(
    margin: EdgeInsets.only(bottom: 20),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    decoration: BoxDecoration(
      color: AppColors.greyCardColor,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(
                AssetsUrl.profileImage,
              ),
            ),
            20.widthBox,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Justine Boyle"
                          .text
                          .size(18)
                          .fontFamily(Typo.medium)
                          .color(AppColors.textColor)
                          .make(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz,
                          color: AppColors.bodyColour,
                        ),
                      ),
                    ],
                  ),
                  14.heightBox,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsUrl.messageIcon,
                        width: 16,
                      ),
                      15.widthBox,
                      Expanded(
                        child: "justineboyle@gmail.com"
                            .text
                            .fontFamily(Typo.medium)
                            .color(AppColors.bodyColour)
                            .make(),
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsUrl.locationIcon,
                        width: 16,
                      ),
                      15.widthBox,
                      Expanded(
                        child: "1901 Thornridge Cir. Shiloh, Hawaii 81063"
                            .text
                            .fontFamily(Typo.medium)
                            .color(AppColors.bodyColour)
                            .make(),
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetsUrl.callIcon,
                        width: 16,
                      ),
                      15.widthBox,
                      Expanded(
                        child: "(704) 555-0127"
                            .text
                            .fontFamily(Typo.medium)
                            .color(AppColors.bodyColour)
                            .make(),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        30.heightBox,
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {},
                child: "Activate".text.make(),
              ),
            ),
            20.widthBox,
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.textColor),
                onPressed: () {},
                child: "Activate".text.make(),
              ),
            )
          ],
        )
      ],
    ),
  );
}
