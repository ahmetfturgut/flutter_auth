import 'package:beauty/view/auth/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
      // return normalNavigate(Login());

      // case NavigationConstants.ON_BOARD:
      //   return normalNavigate(OnBoardView());

      // case NavigationConstants.SETTINGS_WEB_VIEW:
      //   if (args.arguments is SettingsDynamicModel) {
      //     return normalNavigate(SettingsDynamicView(
      //       model: args.arguments as SettingsDynamicModel,
      //     ));
      //   }
      //   throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
