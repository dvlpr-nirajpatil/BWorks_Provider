import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/auth_controller.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/views/dashboard/dashboard_screen.dart';
import 'package:billionworks/views/shared_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static String id = "SignUpScreen";

  TextEditingController nameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController contactNoField = TextEditingController();
  TextEditingController passField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dataController =
        Provider.of<FirestoreController>(context, listen: false);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            75.heightBox,
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              child: SvgPicture.asset(
                AssetsUrl.profileIcon,
                color: Colors.white,
                width: 30,
              ),
            ),
            20.heightBox,
            "Hello User!".text.size(22).fontFamily(Typo.medium).make(),
            10.heightBox,
            SizedBox(
              width: 300,
              child: "Create your account for \nbetter Experience"
                  .text
                  .align(TextAlign.center)
                  .size(16)
                  .color(AppColors.greyTextColor)
                  .make(),
            ),
            10.heightBox,
            CustomTextField(
              controller: nameField,
              label: "Full Name",
            ),
            CustomTextField(
              controller: emailField,
              label: "Email",
            ),
            CustomTextField(
              controller: contactNoField,
              label: "Contact Number",
            ),
            CustomTextField(
              controller: passField,
              label: "Password",
            ),
            10.heightBox,
            Consumer<AuthController>(builder: (context, controller, xxx) {
              return SizedBox(
                height: 50,
                width: double.infinity,
                child: FilledButton(
                    onPressed: () async {
                      controller.loading = true;
                      await controller
                          .userSignUp(context,
                              email: emailField.text, password: passField.text)
                          .then((value) {
                        if (value != null) {
                          controller.storeProviderDetails(
                            fullName: nameField.text,
                            email: emailField.text,
                            contact: contactNoField.text,
                          );
                          dataController.fetchAppData();
                          context.goNamed(DashboardScreen.id);
                        }
                      });
                      controller.loading = false;
                    },
                    child: controller.isloading
                        ? SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "SIGNUP".text.textStyle(Typo.buttonText).make()),
              );
            }),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Alredy have an account?"
                    .text
                    .color(AppColors.bodyColour)
                    .fontFamily(Typo.medium)
                    .make(),
                10.widthBox,
                "Sign In"
                    .text
                    .italic
                    .color(AppColors.primary)
                    .fontFamily(Typo.semiBold)
                    .make()
                    .onTap(() {
                  context.pop();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
