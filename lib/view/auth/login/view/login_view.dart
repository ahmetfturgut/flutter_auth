import 'package:beauty/core/base/view/base_widget.dart';
import 'package:beauty/core/components/text/auto_locale_text.dart';
import 'package:beauty/core/extension/context_extension.dart';
import 'package:beauty/core/init/lang/locale_keys.g.dart';
import 'package:beauty/view/auth/login/viewModel/login_view_model.dart';
import 'package:beauty/view/auth/register/view/register_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
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
          body: TabBarView(children: [
            Padding(
              padding: context.paddingLowVertical,
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: context.paddingMediumHorizontal,
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              buildBodyDesc(context),
                              Padding(
                                padding: context.paddingMediumVertical,
                                child: Container(
                                  child: SingleChildScrollView(
                                    child: buildForm(value, context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  SizedBox(width: 30),
                                  buildForgot(context),
                                  SizedBox(width: 140),
                                  // ignore: deprecated_member_use
                                  buildLoginButton(context, value)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RegisterView()
          ]),
        ),
      ),
    );
  }

  Container buildBodyDesc(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoLocaleText(
            value: LocaleKeys.welcome.tr(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: context.colors.onSecondary, fontWeight: FontWeight.w300),
          ),
          AutoLocaleText(
            value: LocaleKeys.appUser.tr(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                color: context.colors.onSecondary, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  AutoLocaleText buildForgot(BuildContext context) {
    return AutoLocaleText(
      value: LocaleKeys.login_forgotText.tr(),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: context.colors.onSecondary, fontWeight: FontWeight.w500),
    );
  }

  // ignore: deprecated_member_use
  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    // ignore: deprecated_member_use
    return Observer(builder: (_) {
      return RaisedButton(
          child: Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          color: context.colors.error,
          onPressed: () {
            viewModel.fetchLoginSevice();
          });
    });
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      child: Column(
        children: [
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
        ],
      ),
    );
  }

  Padding buildTextFormFieldPassword(
      BuildContext context, LoginViewModel loginViewModel) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: Observer(builder: (_) {
        return TextFormField(
          controller: loginViewModel.passwordController,
          obscureText: loginViewModel.isLockOpen ? true : false,
          validator: (value) =>
              value!.isNotEmpty ? null : LocaleKeys.login_requiredField.tr(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  loginViewModel.isLockStateChange();
                },
                icon: Observer(builder: (_) {
                  return Icon(
                    loginViewModel.isLockOpen ? Icons.lock : Icons.lock_open,
                    color: context.colors.error,
                  );
                })),
            labelText: LocaleKeys.login_password.tr(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
        );
      }),
    );
  }

  TextFormField buildTextFormFieldEmail(
      BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

Container buildContainerIconField(BuildContext context, IconData icon) {
  return Container(
    color: context.colors.error,
    padding: context.paddingLow,
    child: Icon(icon, color: context.colors.background),
  );
}
