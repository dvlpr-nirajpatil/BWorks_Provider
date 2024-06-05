import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/views/auth/login_screen.dart';
import 'package:billionworks/views/shared_widgets/custom_textfield.dart';
import 'package:billionworks/views/shared_widgets/snackbar/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  static String id = "ChangePasswordScreen";

  TextEditingController newPass = TextEditingController();
  TextEditingController rePass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Change Password".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            "Your new password must be different from previous used password"
                .text
                .color(Color(0xff6C757D))
                .fontFamily(Typo.medium)
                .make(),
            20.heightBox,
            CustomTextField(
              controller: newPass,
              label: "New Password",
              isPass: true,
            ),
            10.heightBox,
            CustomTextField(
              controller: rePass,
              label: "Re-enter Password",
              isPass: true,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () async {
                    if (rePass.text == newPass.text) {
                      await auth.currentUser!.updatePassword(newPass.text);
                      await auth.signOut();
                      showSnackbar(context, "Password Change Successfully");
                      Future.delayed(Duration(seconds: 1), () {
                        context.goNamed(LoginScreen.id);
                      });
                    }
                  },
                  child: "Confirm".text.textStyle(Typo.buttonText).make()),
            )
          ],
        ),
      ),
    );
  }
}
