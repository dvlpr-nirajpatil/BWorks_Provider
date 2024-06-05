import 'package:billionworks/consts/packages.dart';
import 'package:billionworks/views/profile/handyman_list/add_handyman/add_handyman.dart';
import 'package:billionworks/views/profile/handyman_list/components/card.dart';
import 'package:go_router/go_router.dart';

class HandyManListScreen extends StatelessWidget {
  const HandyManListScreen({super.key});

  static String id = "HandyManListScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AddHandyManScreen.id);
            },
            icon: Icon(
              Icons.add,
            ),
          )
        ],
        centerTitle: false,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: "Handyman List".text.textStyle(Typo.appBarTitle).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => handymanListCard(),
        ),
      ),
    );
  }
}
