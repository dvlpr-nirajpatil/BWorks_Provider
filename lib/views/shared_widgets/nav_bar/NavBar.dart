import 'package:billionworks/consts/color_pallate.dart';
import 'package:billionworks/consts/images_icons.dart';
import 'package:billionworks/views/bookings/bookings.dart';
import 'package:billionworks/views/dashboard/dashboard_screen.dart';
import 'package:billionworks/views/notification/notifications.dart';
import 'package:billionworks/views/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key, this.selectedScreenIndex = 0});

  int selectedScreenIndex = 0;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<String> navbarItems = [
    AssetsUrl.homeIcon,
    AssetsUrl.bookingIcon,
    AssetsUrl.walletIcon,
    AssetsUrl.notificationIcon
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      height: 85,
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            navbarItems.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedScreenIndex = index;
                });
                if (widget.selectedScreenIndex == 0) {
                  context.goNamed(DashboardScreen.id);
                } else if (widget.selectedScreenIndex == 1) {
                  context.goNamed(BookingScreen.id);
                } else if (widget.selectedScreenIndex == 2) {
                  context.goNamed(WalletScreen.id);
                } else if (widget.selectedScreenIndex == 3) {
                  context.goNamed(NotificationsScreen.id);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: index == widget.selectedScreenIndex
                      ? AppColors.lightPurple
                      : null,
                ),
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset(
                  navbarItems[index],
                  width: 22,
                  color: widget.selectedScreenIndex == index
                      ? AppColors.primary
                      : AppColors.bodyColour,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
