import 'package:billionworks/consts/packages.dart';

Container bookingDetailsScreenCard({isCustomer = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    decoration: BoxDecoration(
        color: AppColors.greyCardColor,
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        // Image and Name
        Row(
          children: [
            //photo
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(AssetsUrl.handymanImage),
            ),

            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Justine Boyle",
                  style: TextStyle(
                    fontFamily: "Medium",
                    fontSize: 18,
                    color: Color(0xff1C1F34),
                  ),
                ),
                SizedBox(
                  height: 7.5,
                ),
                isCustomer
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            AssetsUrl.messageIcon,
                            width: 14,
                          ),
                          10.widthBox,
                          "example@gmail.com"
                              .text
                              .color(Color(0xff6C757D))
                              .fontFamily(Typo.medium)
                              .make()
                        ],
                      )
                    : Text(
                        "Cleaning Expert",
                        style: TextStyle(
                            color: Color(0xff6C757D), fontFamily: "Medium"),
                      ),
                SizedBox(
                  height: 5,
                ),
                isCustomer
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            AssetsUrl.locationIcon,
                            width: 14,
                          ),
                          10.widthBox,
                          Container(
                            width: 170,
                            child: "1901 Thornridge Cirav sdfasdfasf"
                                .text
                                .overflow(TextOverflow.ellipsis)
                                .color(Color(0xff6C757D))
                                .fontFamily(Typo.medium)
                                .make(),
                          )
                        ],
                      )
                    : Row(
                        children: [
                          VxRating(
                            selectionColor: AppColors.activeRatingColor,
                            onRatingUpdate: (value) {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                              fontFamily: "Medium",
                              color: Color(0xff6C757D),
                            ),
                          )
                        ],
                      ),
              ],
            )
          ],
        ),

        // rate handyman
        TextButton(
          onPressed: () {},
          child: Text(
            "Rate Handyman",
            style: TextStyle(
              color: Color(0xff5F60B9),
            ),
          ),
        )
      ],
    ),
  );
}
