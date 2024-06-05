import 'package:billionworks/consts/packages.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static String id = "NotificationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Notification".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "New"
                    .text
                    .fontFamily(Typo.medium)
                    .color(AppColors.textColor)
                    .make(),
                "Mark as all read"
                    .text
                    .color(AppColors.primary)
                    .size(12)
                    .fontFamily(Typo.medium)
                    .make()
              ],
            ),
            10.heightBox,
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            6,
                          ),
                        ),
                        child: Image.asset(
                          AssetsUrl.handymanImage,
                          width: 60,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                      15.widthBox,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Add Booking"
                                    .text
                                    .size(18)
                                    .fontFamily(Typo.medium)
                                    .color(AppColors.textColor)
                                    .make(),
                                "02 min ago"
                                    .text
                                    .size(12)
                                    .color(AppColors.greyTextColor)
                                    .fontFamily(Typo.medium)
                                    .make(),
                              ],
                            ),
                            5.heightBox,
                            "New Booking Added by"
                                .text
                                .fontFamily(Typo.medium)
                                .color(AppColors.greyTextColor)
                                .make(),
                            "Manny Jah"
                                .text
                                .fontFamily(Typo.medium)
                                .color(AppColors.textColor)
                                .make(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
