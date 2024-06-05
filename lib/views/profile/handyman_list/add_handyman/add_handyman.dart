import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/controller/handymans_controller.dart';
import 'package:billionworks/views/shared_widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AddHandyManScreen extends StatelessWidget {
  AddHandyManScreen({super.key});

  HandymanController? controller;

  static String id = "AddHandyManScreen";

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      controller = Provider.of<HandymanController>(context, listen: false);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
        title: "Add Handyman".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        child: Column(
          children: [
            CustomTextField(
              controller: controller!.model.fullname,
              label: "Full Name",
            ),
            CustomTextField(
              controller: controller!.model.email,
              label: "Email",
            ),
            CustomTextField(
              controller: controller!.model.phoneNumber,
              label: "Phone Number",
            ),
            CustomTextField(
              controller: controller!.model.city,
              label: "City",
            ),
            CustomTextField(
              controller: controller!.model.password,
              label: "Password",
              isPass: true,
            ),
            20.heightBox,
            SizedBox(
              width: double.infinity,
              child: Consumer<HandymanController>(
                  builder: (context, controller, xxx) {
                return FilledButton(
                    onPressed: () {
                      controller.addHandyman(context);
                    },
                    child: controller.isLoading
                        ? SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "Save".text.textStyle(Typo.buttonText).make());
              }),
            )
          ],
        ),
      ),
    );
  }
}
