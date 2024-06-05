import 'dart:io';

import 'package:billionworks/consts/list.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/controller/add_service_controller.dart';
import 'package:billionworks/models/forms_models/service_details_model.dart';
import 'package:billionworks/views/shared_widgets/snackbar/custom_snackbar.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

class AddServiceScreen extends StatelessWidget {
  AddServiceScreen({super.key});

  static String id = "AddServicesScreen";

  InputDecoration inpDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    label: "Service Name".text.make(),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12)),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var controller = Provider.of<AddServiceController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: "Add Service".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.heightBox,
              Consumer<AddServiceController>(
                  builder: (context, controller, xxx) {
                return controller.serviceDetails.serviceImage == null
                    ? DottedBorder(
                        radius: Radius.circular(20),
                        dashPattern: [6, 6],
                        color: AppColors.primary,
                        child: GestureDetector(
                          onTap: controller.pickServiceImage,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: size.height * 0.17,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AssetsUrl.gallaryIcon,
                                  color: AppColors.bodyColour,
                                ),
                                10.heightBox,
                                "Choose Manage"
                                    .text
                                    .size(16)
                                    .fontFamily(Typo.medium)
                                    .color(AppColors.textColor)
                                    .make()
                              ],
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.file(
                              File(
                                  controller.serviceDetails.serviceImage!.path),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(Icons.close, color: Colors.white)
                                .centered()
                                .box
                                .roundedFull
                                .padding(
                                  EdgeInsets.all(3),
                                )
                                .color(AppColors.primary)
                                .make()
                                .onTap(() {
                              controller.removeImage();
                            }),
                          )
                        ],
                      );
              }),
              20.heightBox,
              "Support: JPG, PNG, JPEG"
                  .text
                  .color(AppColors.greyTextColor)
                  .size(12)
                  .make(),
              20.heightBox,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: AppColors.greyCardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.serviceDetails.serviceName,
                      decoration: inpDecoration,
                    ),
                    20.heightBox,
                    customDropDownButton(
                        selectedValue:
                            controller.serviceDetails.selectedCategory,
                        label: "Select Category",
                        onChange: (value) {
                          controller.serviceDetails.selectedCategory = value;
                        },
                        list: serviceCategories),
                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: customDropDownButton(
                              onChange: (val) {
                                controller.serviceDetails.selectedType = val;
                              },
                              label: "Type",
                              list: ServiceDetailsOptions.serviceTypes),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: customDropDownButton(
                              onChange: (val) {
                                controller.serviceDetails.selectedStatus = val;
                              },
                              label: "Status",
                              list: ServiceDetailsOptions.serviceStatus),
                        )
                      ],
                    ),
                    20.heightBox,
                    TextFormField(
                      controller: controller.serviceDetails.price,
                      decoration:
                          inpDecoration.copyWith(label: "Price".text.make()),
                    ),
                    20.heightBox,
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.serviceDetails.hours,
                            decoration: inpDecoration.copyWith(
                              label: "Duration Hours".text.make(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.serviceDetails.min,
                            decoration: inpDecoration.copyWith(
                                label: "Duration mint".text.make()),
                          ),
                        )
                      ],
                    ),
                    20.heightBox,
                    TextFormField(
                      controller: controller.serviceDetails.desc,
                      maxLines: 4,
                      decoration: inpDecoration.copyWith(
                        hintText: "Description of Service",
                        label: "Description of Service".text.make(),
                      ),
                    )
                  ],
                ),
              ),
              20.heightBox,
              SizedBox(
                width: double.infinity,
                child: Consumer<AddServiceController>(
                    builder: (context, controller, xxx) {
                  return FilledButton(
                    onPressed: () async {
                      await controller.addService();
                      showSnackbar(context, "New Service Added");
                    },
                    child: controller.is_loading
                        ? SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "Save".text.textStyle(Typo.buttonText).make(),
                  );
                }),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> customDropDownButton({
    label,
    onChange,
    selectedValue,
    required List<String> list,
  }) {
    return DropdownButtonFormField(
      value: selectedValue,
      isExpanded: true,
      dropdownColor: Colors.white,
      borderRadius: BorderRadius.circular(12),
      icon: Icon(
        Icons.expand_more,
      ),
      decoration: inpDecoration.copyWith(
        label: "$label".text.make(),
      ),
      items: list
          .map((e) => DropdownMenuItem(
                value: e,
                child: "$e".text.make(),
              ))
          .toList(),
      onChanged: onChange,
    );
  }
}
