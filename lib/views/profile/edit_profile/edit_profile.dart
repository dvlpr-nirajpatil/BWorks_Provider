import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/controller/edit_profile_controller.dart';
import 'package:billionworks/controller/firestore_controller.dart';
import 'package:billionworks/views/shared_widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  static String id = "EditProfileScreen";

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appData = Provider.of<FirestoreController>(context, listen: false);
    var controller = Provider.of<EditProfileController>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    email.text = auth.currentUser!.email!;
    name.text = auth.currentUser!.displayName!;
    phone.text = appData.userData!.contact!;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.check,
            ),
          )
        ],
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: "Edit Profile".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                      : NetworkImage(
                          auth.currentUser!.photoURL!,
                        ),
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
                        controller.pickProfilePicture();
                      },
                      icon: SvgPicture.asset(
                        AssetsUrl.cameraIcon,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            CustomTextField(
              controller: name,
              label: "Full Name",
            ),
            CustomTextField(
              controller: email,
              label: "Email",
              readOnly: true,
            ),
            CustomTextField(
              controller: phone,
              label: "Phone Number",
            ),
            20.heightBox,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              child: Consumer<EditProfileController>(
                  builder: (context, controller, xxx) {
                return FilledButton(
                  onPressed: () {
                    controller.updateProfile(
                        name: name.text, phone: phone.text);
                  },
                  child: controller.isLoading
                      ? SizedBox(
                          width: 10,
                          height: 10,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : "Save".text.textStyle(Typo.buttonText).make(),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
