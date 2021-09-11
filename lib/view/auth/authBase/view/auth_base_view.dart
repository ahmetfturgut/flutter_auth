import 'package:beauty/core/base/view/base_widget.dart';
import 'package:beauty/core/components/text/auto_locale_text.dart';
import 'package:beauty/core/extension/context_extension.dart';
import 'package:beauty/core/init/lang/locale_keys.g.dart';
import 'package:beauty/view/auth/login/view/login_view.dart';
import 'package:beauty/view/auth/login/viewModel/login_view_model.dart';
import 'package:beauty/view/auth/register/view/register_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthBaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          appBar: buildTabBar(context),
          body: TabBarView(children: [LoginView(), RegisterView()]),
        ),
      ),
    );
  }

  AppBar buildTabBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        tabs: [
          Tab(
            child: AutoLocaleText(
              value: LocaleKeys.login_tab1.tr(),
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 15),
            ),
          ),
          Tab(
            child: AutoLocaleText(
              value: LocaleKeys.login_tab2.tr(),
              style:
                  Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 15),
            ),
          ),
        ],
        indicatorSize: TabBarIndicatorSize.values.last,
        indicatorColor: context.colors.error,
      ),
    );
  }
}
