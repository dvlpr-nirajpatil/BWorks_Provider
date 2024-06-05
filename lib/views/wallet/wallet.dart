import 'package:billionworks/consts/color_pallate.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  static String id = "WalletScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Payment",
          style: TextStyle(
              color: Colors.white, fontFamily: "Medium", fontSize: 18),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: double.infinity,
        child: ListView(
          children: [
            // card
            paymentScreenCard(
                status: "Paid",
                name: "Niraj Patil",
                id: "112",
                paymentId: "204",
                amount: "1200",
                method: "UPI"),
            paymentScreenCard(
                status: "Paid",
                name: "Riyu Patil",
                id: "113",
                paymentId: "205",
                amount: "1200",
                method: "CREDIT CARD"),
            paymentScreenCard(
                status: "Paid",
                name: "Piyush Jadhav",
                id: "114",
                paymentId: "206",
                amount: "100",
                method: "CASH"),
          ],
        ),
      ),
    );
  }

  Container paymentScreenCard({name, paymentId, id, status, method, amount}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.borderColor,
          )),
      child: Column(
        children: [
          // pink container
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            decoration: BoxDecoration(color: Color(0xffF0F0FA)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Medium",
                      color: Color(0xff1C1F34)),
                ),
                Text(
                  "#$paymentId",
                  style: TextStyle(
                      color: Color(0xff5F60B9),
                      fontFamily: "SemiBold",
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                paymentCardRow(title: "ID", desc: "#$id"),
                paymentCardRow(title: "Status", desc: status),
                paymentCardRow(title: "Method", desc: method),
                paymentCardRow(
                    title: "Amount Paid",
                    desc: "\$$amount",
                    haveDivider: false,
                    isBold: true),
              ],
            ),
          )
        ],
      ),
    );
  }

  paymentCardRow({title, desc, haveDivider = true, isBold = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    TextStyle(color: Color(0xff1C1F34), fontFamily: "Medium"),
              ),
              Text(
                desc,
                style: TextStyle(
                  color: Color(isBold ? 0xff5F60B9 : 0xff6C757D),
                  fontFamily: isBold ? "SemiBold" : "Medium",
                ),
              )
            ],
          ),
        ),
        haveDivider
            ? Divider(
                color: AppColors.borderColor,
              )
            : SizedBox(),
      ],
    );
  }
}
