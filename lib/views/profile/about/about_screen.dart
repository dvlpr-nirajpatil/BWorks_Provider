import 'package:billionworks/consts/packages.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static String id = "AboutScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "About".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        width: double.infinity,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 150),
          children: [
            aboutScreenCard(
                icon: AssetsUrl.documentIcon, msg: "Terms and conditions"),
            aboutScreenCard(icon: AssetsUrl.shieldIcon, msg: "Privacy Policy"),
            aboutScreenCard(
                icon: AssetsUrl.documentIcon, msg: "Help and support"),
            aboutScreenCard(icon: AssetsUrl.callIcon, msg: "Helpline Number"),
          ],
        ),
      ),
    );
  }

  Container aboutScreenCard({icon, msg}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.greyCardColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            color: AppColors.bodyColour,
          ),
          20.heightBox,
          "$msg"
              .text
              .size(16)
              .fontFamily(Typo.medium)
              .color(AppColors.textColor)
              .make()
        ],
      ),
    );
  }
}
