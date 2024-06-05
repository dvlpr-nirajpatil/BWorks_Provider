import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/models/service_data_model.dart';
import 'package:billionworks/views/dashboard/components/services_grid.dart';
import 'package:billionworks/views/service_list/add_service/add_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:velocity_x/velocity_x.dart';

class ServicesList extends StatefulWidget {
  ServicesList({super.key});
  static String id = "ServicesList";

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  bool listEnabled = true;
  @override
  Widget build(BuildContext context) {
    var dataController =
        Provider.of<FirestoreController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  listEnabled = !listEnabled;
                });
              },
              icon: SvgPicture.asset(
                  listEnabled ? AssetsUrl.listIcon : AssetsUrl.gridIcon)),
          IconButton(
            onPressed: () {
              context.pushNamed(AddServiceScreen.id);
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
        centerTitle: false,
        title: "Service List".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            20.heightBox,
            TextField(
              decoration: InputDecoration(
                  hintText: "Search Here..",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade100),
            ),
            20.heightBox,
            listEnabled
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataController.services.length,
                      itemBuilder: (context, index) =>
                          ServicelistViewCard(dataController.services[index]),
                    ),
                  )
                : Expanded(
                    child: ServicesGrid(context, dataController.services,
                        MediaQuery.of(context).size))
          ],
        ),
      ),
    );
  }

  Stack ServicelistViewCard(ServiceDataModel data) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.serviceCardBackgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) =>
                      Container().shimmer(),
                  imageUrl: data.img!,
                  fit: BoxFit.cover,
                ),
              ),
              10.heightBox,
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxRating(
                      normalColor: Colors.grey.shade400,
                      selectionColor: AppColors.primary,
                      onRatingUpdate: (value) {},
                    ),
                    5.heightBox,
                    TextScroll(
                      "${data.name}",
                      style: TextStyle(
                          fontFamily: Typo.medium, color: AppColors.textColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 90,
          right: 12,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppColors.greyCardColor,
                borderRadius: BorderRadius.circular(14)),
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "₹${data.price}",
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: Typo.semiBold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 20,
          child: Container(
            width: 120,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: TextScroll(
              "${data.category}",
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        )
      ],
    );
  }
}
