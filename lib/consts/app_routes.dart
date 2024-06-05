import 'package:billionworks/models/booking_data_model.dart';
import 'package:billionworks/views/auth/login_screen.dart';
import 'package:billionworks/views/auth/signup_screen.dart';
import 'package:billionworks/views/bookings/booking_details/booking_details_screen.dart';
import 'package:billionworks/views/bookings/bookings.dart';
import 'package:billionworks/views/dashboard/dashboard_screen.dart';
import 'package:billionworks/views/service_list/add_service/add_service.dart';
import 'package:billionworks/views/service_list/service_details/service_details.dart';
import 'package:billionworks/views/service_list/services_list.dart';
import 'package:billionworks/views/notification/notifications.dart';
import 'package:billionworks/views/profile/about/about_screen.dart';
import 'package:billionworks/views/profile/change_password/change_password.dart';
import 'package:billionworks/views/profile/edit_profile/edit_profile.dart';
import 'package:billionworks/views/profile/handyman_list/add_handyman/add_handyman.dart';
import 'package:billionworks/views/profile/handyman_list/handyman_list.dart';
import 'package:billionworks/views/profile/profile_screen.dart';
import 'package:billionworks/views/shared_widgets/nav_bar/NavBar.dart';
import 'package:billionworks/views/splash_screen/splash_screen.dart';
import 'package:billionworks/views/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.id,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/Auth',
        name: LoginScreen.id,
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'SignUp',
            name: SignUpScreen.id,
            builder: (context, state) => SignUpScreen(),
          )
        ],
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return Scaffold(
            body: child,
            bottomNavigationBar: NavBar(
              selectedScreenIndex: calculateSelectedIndex(state),
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: DashboardScreen.id,
            builder: (context, state) => const DashboardScreen(),
            routes: [
              GoRoute(
                path: 'profileScreen',
                name: ProfileScreen.id,
                builder: (context, state) => ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'about',
                    name: AboutScreen.id,
                    builder: (context, state) => AboutScreen(),
                  ),
                  GoRoute(
                    path: 'changePassword',
                    name: ChangePasswordScreen.id,
                    builder: (context, state) => ChangePasswordScreen(),
                  ),
                  GoRoute(
                    path: 'editProfile',
                    name: EditProfileScreen.id,
                    builder: (context, state) => EditProfileScreen(),
                  ),
                  GoRoute(
                    path: 'handymanList',
                    name: HandyManListScreen.id,
                    builder: (context, state) => HandyManListScreen(),
                    routes: [
                      GoRoute(
                          path: 'addHandyman',
                          name: AddHandyManScreen.id,
                          builder: (context, state) => AddHandyManScreen())
                    ],
                  )
                ],
              ),
            ],
          ),
          GoRoute(
              path: '/bookings',
              name: BookingScreen.id,
              builder: (context, state) => BookingScreen(),
              routes: [
                GoRoute(
                  path: 'details',
                  name: BookingDetailsScreen.id,
                  builder: (context, state) {
                    var data = state.extra as BookingDataModel;
                    return BookingDetailsScreen(
                      data: data,
                    );
                  },
                )
              ]),
          GoRoute(
            path: '/wallet',
            name: WalletScreen.id,
            builder: (context, state) => WalletScreen(),
          ),
          GoRoute(
            path: '/notification',
            name: NotificationsScreen.id,
            builder: (context, state) => const NotificationsScreen(),
          ),
          GoRoute(
            path: '/servicesList',
            name: ServicesList.id,
            builder: (context, state) => ServicesList(),
            routes: [
              GoRoute(
                path: 'addService',
                name: AddServiceScreen.id,
                builder: (context, state) => AddServiceScreen(),
              ),
              GoRoute(
                path: 'serviceDetails',
                name: ServiceDetailsScreen.id,
                builder: (context, state) => ServiceDetailsScreen(),
              )
            ],
          ),
        ],
      ),
    ],
  );
}

int calculateSelectedIndex(GoRouterState state) {
  final location = state.matchedLocation;
  if (location.startsWith('/dashboard')) {
    return 0;
  }
  if (location.startsWith('/bookings')) {
    return 1;
  }
  if (location.startsWith('/wallet')) {
    return 2;
  }
  if (location.startsWith('/notification')) {
    return 3;
  }
  return -1;
}
