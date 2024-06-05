import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/controller/auth_controller.dart';
import 'package:billionworks/views/auth/signup_screen.dart';
import 'package:billionworks/views/service_list/services_list.dart';
import 'package:billionworks/views/profile/about/about_screen.dart';
import 'package:billionworks/views/profile/change_password/change_password.dart';
import 'package:billionworks/views/profile/edit_profile/edit_profile.dart';
import 'package:billionworks/views/profile/handyman_list/handyman_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  static String id = "ProfileScreen";

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
        title: "Profile".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: auth.currentUser!.photoURL == null
                      ? null
                      : NetworkImage(auth.currentUser!.photoURL!),
                  child: auth.currentUser!.photoURL == null
                      ? "${auth.currentUser!.displayName![0].capitalized}"
                          .text
                          .textStyle(
                            TextStyle(fontSize: 48, color: AppColors.primary),
                          )
                          .make()
                      : null,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: IconButton.filled(
                      onPressed: () {
                        context.goNamed(EditProfileScreen.id);
                      },
                      icon: SvgPicture.asset(
                        AssetsUrl.editProfileIcon,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            "${auth.currentUser!.displayName}"
                .text
                .size(22)
                .color(AppColors.textColor)
                .fontFamily(Typo.medium)
                .make(),
            "${auth.currentUser!.email}"
                .text
                .size(16)
                .color(AppColors.greyTextColor)
                .fontFamily(Typo.medium)
                .make(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.greyCardColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //------------------------------------
                    profileOptionsRow(
                        onTap: () {
                          context.pushNamed(ServicesList.id);
                        },
                        icon: AssetsUrl.gridIcon,
                        title: "My Service"),
                    7.heightBox,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: AppColors.borderColor,
                      ),
                    ),
                    //------------------------------------
                    profileOptionsRow(
                        onTap: () {
                          context.goNamed(HandyManListScreen.id);
                        },
                        icon: AssetsUrl.usersIcon,
                        title: "Handyman"),
                    7.heightBox,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: AppColors.borderColor,
                      ),
                    ),
                    profileOptionsRow(
                        icon: AssetsUrl.earningIcon, title: "Earning"),
                    7.heightBox,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: AppColors.borderColor,
                      ),
                    ),
                    profileOptionsRow(
                        onTap: () {
                          context.goNamed(ChangePasswordScreen.id);
                        },
                        icon: AssetsUrl.changePassIcon,
                        title: "Change Password"),
                    7.heightBox,
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: AppColors.borderColor,
                      ),
                    ),
                    profileOptionsRow(
                        onTap: () {
                          context.goNamed(AboutScreen.id);
                        },
                        icon: AssetsUrl.aboutIcon,
                        title: "About"),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                authController.userSignOut();
                GoRouter.of(context).goNamed(SignUpScreen.id);
              },
              child: Container(
                height: size.height * 0.1,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: "Logout"
                      .text
                      .size(18)
                      .fontFamily(Typo.medium)
                      .color(AppColors.primary)
                      .make(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  profileOptionsRow({icon, title, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.greyCardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                  color: AppColors.greyTextColor,
                ),
                10.widthBox,
                "$title"
                    .text
                    .size(16)
                    .fontFamily(Typo.medium)
                    .color(AppColors.textColor)
                    .make(),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.greyTextColor,
            )
          ],
        ),
      ),
    );
  }
}
