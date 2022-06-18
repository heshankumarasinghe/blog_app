import 'package:blog_app/screens/my_groups_screen.dart';
import 'package:flutter/material.dart';

import '../constants/routes.dart';
import '../screens/error_route_screen.dart';
import '../screens/login_or_register_screen.dart';
import '../screens/primary_feed_screen.dart';
import '../screens/admin_group_screen.dart';
import '../screens/add_post_screen.dart';
import '../screens/add_poll_screen.dart';
import '../screens/my_polls_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.toLoginOrRegisterScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginOrRegisterScreen(),
        );

      case Routes.toPrimaryFeedScreen:
        return MaterialPageRoute(
          builder: (_) => const PrimaryFeedScreen(),
        );

      case Routes.toAdminGroupScreen:
        return MaterialPageRoute(
          builder: (_) => const AdminGroupScreen(),
        );

      case Routes.toAddPostScreen:
        return MaterialPageRoute(
          builder: (_) => const AddPostScreen(),
        );

      case Routes.toAddPollScreen:
        return MaterialPageRoute(
          builder: (_) => const AddPollScreen(),
        );

      case Routes.toMyGroupsScreen:
        return MaterialPageRoute(
          builder: (_) => const MyGroupsScreen(),
        );

      case Routes.toMyPollsScreen:
        return MaterialPageRoute(
          builder: (_) => const MyPollsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorRouteScreen(),
        );
    }
  }
}
