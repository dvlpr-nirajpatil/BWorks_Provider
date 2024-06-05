import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/models/booking_data_model.dart';
import 'package:billionworks/utils/functions.dart';
import 'package:billionworks/views/bookings/booking_details/components/booking_details_card.dart';
import 'package:billionworks/views/bookings/booking_details/components/payment_details_card.dart';
import 'package:billionworks/views/bookings/booking_details/components/price_details_card.dart';
import 'package:billionworks/views/bookings/booking_details/components/status_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({super.key, required this.data});

  static String id = "BookingDetailsScreen";

  BookingDataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          "${data.status}",
          style: TextStyle(
            fontFamily: "Medium",
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              showCheckStatusModalBottomSheet(context);
            },
            child: Text(
              "Check Status",
              style: TextStyle(color: Colors.white, fontFamily: "Medium"),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Booking ID",
                        style: TextStyle(
                            color: Color(0xff6C757D),
                            fontSize: 16,
                            fontFamily: "Medium"),
                      ),
                      Text(
                        "#123",
                        style: TextStyle(
                            fontFamily: "SemiBold",
                            color: Color(0xff5F60B9),
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.borderColor,
                  ),
                  SizedBox(height: 15),

                  // service title and image
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.service!.name}",
                              style: TextStyle(
                                  fontFamily: "Medium",
                                  color: Color(0xff1C1F34),
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Date Time :",
                                  style: TextStyle(
                                    color: Color(0xff1C1F34),
                                    fontFamily: "Medium",
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "${formatDateTimeString(data.service!.dateTime!)}",
                                  style: TextStyle(
                                      color: Color(0xff6C757D),
                                      fontFamily: "Medium"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: CachedNetworkImage(
                          imageUrl: data.service!.img!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  // About Handyman

                  20.heightBox,
                  Text(
                    "About Customer",
                    style: TextStyle(
                        fontFamily: "Medium",
                        color: Color(0xff1C1F34),
                        fontSize: 16),
                  ),
                  10.heightBox,
                  bookingDetailsScreenCard(isCustomer: true),
                  20.heightBox,
                  Text(
                    "Payment Details",
                    style: TextStyle(
                        fontFamily: "Medium",
                        color: Color(0xff1C1F34),
                        fontSize: 16),
                  ),
                  10.heightBox,
                  paymentDetailsCard(),
                  20.heightBox,
                  Text(
                    "Price Details",
                    style: TextStyle(
                        fontFamily: "Medium",
                        color: Color(0xff1C1F34),
                        fontSize: 16),
                  ),
                  10.heightBox,
                  priceDetailsCard(),
                  100.heightBox,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: Text(
                  "Cancle Booking",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
