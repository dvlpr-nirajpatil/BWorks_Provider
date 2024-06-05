import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/models/booking_data_model.dart';
import 'package:billionworks/utils/functions.dart';
import 'package:billionworks/views/bookings/booking_details/booking_details_screen.dart';
import 'package:billionworks/views/shared_widgets/popup/custom_popup.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});
  static String id = "BookingScreen";
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late FirestoreController dataController;
  String selectedStatus = "All";

  @override
  initState() {
    dataController = Provider.of<FirestoreController>(context, listen: false);

    super.initState();
  }

  List<String> bookingStatusList = ["All", "Pending", "Completed", "Ongoing"];

  showBookingSummary(BookingDataModel data) {
    customModalPopUp(
        title: "Booking Summary",
        content: bookingSummaryDetails(data),
        context: context);
  }

  Column bookingSummaryDetails(BookingDataModel data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        70.heightBox,
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: data.service!.img!,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "${data.service!.name!}"
                .text
                .size(16)
                .color(Color(0xff1C1F34))
                .fontFamily(Typo.medium)
                .make(),
            "₹120"
                .text
                .size(22)
                .fontFamily(Typo.semiBold)
                .color(AppColors.primary)
                .make()
          ],
        ),
        20.heightBox,
        customTableRow(title: "Date", desc: "25 Feb, 2022"),
        customTableRow(title: "Time", desc: "08:30 AM"),
        customTableRow(title: "Location", desc: "${data.customer!.address}"),
        customTableRow(title: "Service Status", desc: "${data.status}"),
        20.heightBox,
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              changeBookingStatus(data.docId, "Accepted");
              context.pop();
            },
            child: "Confirm".text.textStyle(Typo.buttonText).make(),
          ),
        ),
        20.heightBox
      ],
    );
  }

  Column customTableRow({title, desc, showDivider = true}) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: title
                    .toString()
                    .text
                    .size(12)
                    .color(Color(0xff1C1F34))
                    .fontFamily(Typo.medium)
                    .make()),
            Expanded(
                flex: 2,
                child: desc
                    .toString()
                    .text
                    .align(TextAlign.right)
                    .color(
                      Color(0xff6C757D),
                    )
                    .fontFamily(Typo.medium)
                    .size(12)
                    .make()),
          ],
        ),
        showDivider
            ? Divider(
                color: Colors.grey.shade300,
              )
            : SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Booking".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            20.heightBox,
            DropdownButtonFormField(
              value: selectedStatus,
              icon: Icon(
                Icons.expand_more,
              ),
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100.withOpacity(0.8),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
              items: bookingStatusList
                  .map(
                    (value) => DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            ),
            20.heightBox,
            Expanded(
              child: Consumer<FirestoreController>(
                  builder: (context, controller, xxx) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.bookings.length,
                  itemBuilder: (context, index) =>
                      bookingScreenCard(controller.bookings[index], index),
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  bookingScreenCard(BookingDataModel data, id) {
    return GestureDetector(
      onTap: () {
        context.goNamed(BookingDetailsScreen.id, extra: data);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: data.service!.img!,
                    fit: BoxFit.cover,
                    height: 125,
                    width: double.infinity,
                  ),
                ),
                15.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "${data.service!.name}"
                        .text
                        .size(16)
                        .fontFamily(Typo.medium)
                        .color(
                          Color(0xff1C1F34),
                        )
                        .make(),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: "#${id + 1}"
                            .text
                            .white
                            .size(14)
                            .fontFamily(Typo.semiBold)
                            .make())
                  ],
                ),
                10.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "₹ ${data.service!.price!}"
                        .text
                        .size(22)
                        .color(AppColors.primary)
                        .fontFamily(Typo.semiBold)
                        .make(),
                  ],
                ),
                15.heightBox,
                Row(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        AssetsUrl.locationIcon,
                        width: 15,
                        color: Color(0xff130F26),
                      ),
                    ),
                    15.widthBox,
                    Expanded(
                      child: "${data.customer!.address!}"
                          .text
                          .size(12)
                          .color(
                            Color(0xff6C757D),
                          )
                          .make(),
                    )
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        AssetsUrl.calendarIcon,
                        width: 15,
                        color: Color(0xff130F26),
                      ),
                    ),
                    15.widthBox,
                    Expanded(
                      child: data.service!.dateTime!.text
                          .size(12)
                          .color(
                            Color(0xff6C757D),
                          )
                          .make(),
                    )
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    SizedBox(
                      child: SvgPicture.asset(
                        AssetsUrl.profileIcon,
                        width: 15,
                        color: Color(0xff130F26),
                      ),
                    ),
                    15.widthBox,
                    Expanded(
                      child: "${data.customer!.name!}"
                          .text
                          .size(12)
                          .color(
                            Color(0xff6C757D),
                          )
                          .make(),
                    )
                  ],
                ),
                20.heightBox,
                Divider(
                  color: Color(0xffEBEBEB),
                ),
                20.heightBox,
                Row(
                  children: [
                    data.status == "pending"
                        ? Expanded(
                            child: FilledButton(
                              onPressed: () {
                                showBookingSummary(data);
                              },
                              child: "Accept"
                                  .text
                                  .textStyle(Typo.buttonText)
                                  .make(),
                            ),
                          )
                        : SizedBox(),
                    10.widthBox,
                    Expanded(
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: Color(0xffF6F7F9)),
                        onPressed: () {
                          changeBookingStatus(id, "Declined");
                        },
                        child: "Decline"
                            .text
                            .textStyle(Typo.buttonText
                                .copyWith(color: Color(0xff1C1F34)))
                            .make(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 25,
            child: "${data.status}"
                .text
                .color(AppColors.primary)
                .make()
                .box
                .roundedLg
                .color(AppColors.lightPurple)
                .padding(
                  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                )
                .make(),
          )
        ],
      ),
    );
  }
}
