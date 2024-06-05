import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/consts/typography.dart';
import 'package:billionworks/controller/auth_controller.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/views/auth/signup_screen.dart';
import 'package:billionworks/views/dashboard/dashboard_screen.dart';
import 'package:billionworks/views/shared_widgets/custom_textfield.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  static String id = "LoginScreen";

  @override
  Widget build(BuildContext context) {
    var dataController =
        Provider.of<FirestoreController>(context, listen: false);
    var controller = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          width: double.infinity,
          child: Column(
            children: [
              100.heightBox,
              "Hello!"
                  .text
                  .textStyle(
                    TextStyle(
                      fontFamily: Typo.medium,
                      fontSize: 22,
                    ),
                  )
                  .make(),
              20.heightBox,
              "Welcome Back, you have been\n missed for long Time"
                  .text
                  .align(TextAlign.center)
                  .textStyle(Typo.signInScreenTitle)
                  .make(),
              50.heightBox,
              CustomTextField(
                controller: emailField,
                label: "Email",
              ),
              10.heightBox,
              CustomTextField(
                controller: passField,
                label: "Password",
                isPass: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        focusColor: AppColors.primary,
                        checkColor: Colors.white,
                        value: true,
                        onChanged: (value) {},
                      ),
                      "Remember Me".text.color(AppColors.bodyColour).make(),
                    ],
                  ),
                  "Forget Password?"
                      .text
                      .italic
                      .color(AppColors.primary)
                      .fontFamily(Typo.semiBold)
                      .make(),
                ],
              ),
              20.heightBox,
              SizedBox(
                height: 45,
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    controller
                        .userSignIn(context,
                            email: emailField.text, password: passField.text)
                        .then((value) {
                      if (value != null) {
                        dataController.fetchAppData();
                        context.goNamed(DashboardScreen.id);
                      }
                    });
                  },
                  child: "LOGIN".text.textStyle(Typo.buttonText).make(),
                ),
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Don't have an account?"
                      .text
                      .color(AppColors.bodyColour)
                      .fontFamily(Typo.medium)
                      .make(),
                  10.widthBox,
                  "Sign Up"
                      .text
                      .italic
                      .color(AppColors.primary)
                      .fontFamily(Typo.semiBold)
                      .make()
                      .onTap(() {
                    context.goNamed(SignUpScreen.id);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
