import 'package:beauty/core/base/view/base_widget.dart';
import 'package:beauty/core/components/text/auto_locale_text.dart';
import 'package:beauty/core/extension/context_extension.dart';
import 'package:beauty/core/init/lang/locale_keys.g.dart';
import 'package:beauty/view/auth/register/viewmodel/register_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RegisterViewModel value) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: value.scaffoldState,
          body: Padding(
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
                            Container(
                              child: SingleChildScrollView(
                                child: buildForm(value, context),
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
                                buildRegisterButton(context, value)
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
      value: LocaleKeys.register_forgotText.tr(),
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: context.colors.onSecondary, fontWeight: FontWeight.w500),
    );
  }

  // ignore: deprecated_member_use
  Widget buildRegisterButton(
      BuildContext context, RegisterViewModel viewModel) {
    // ignore: deprecated_member_use
    return Observer(builder: (_) {
      return RaisedButton(
          child: Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          color: context.colors.error,
          onPressed: () {
            viewModel.fetchRegisterSevice();
          });
    });
  }

  Form buildForm(RegisterViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      child: Column(
        children: [
          buildTextFormFieldName(context, value),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(
      BuildContext context, RegisterViewModel registerViewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: registerViewModel.passwordController,
        obscureText: registerViewModel.isLockOpen ? true : false,
        validator: (value) =>
            value!.isNotEmpty ? null : LocaleKeys.register_requiredField.tr(),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                registerViewModel.isLockStateChange();
              },
              icon: Observer(builder: (_) {
                return Icon(
                  registerViewModel.isLockOpen ? Icons.lock : Icons.lock_open,
                  color: context.colors.error,
                );
              })),
          labelText: LocaleKeys.register_password.tr(),
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
    });
  }

  Padding buildTextFormFieldName(
      BuildContext context, RegisterViewModel registerViewModel) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Observer(builder: (_) {
        return TextFormField(
          controller: registerViewModel.name,
          validator: (value) =>
              value!.isNotEmpty ? null : LocaleKeys.register_requiredField.tr(),
          decoration: InputDecoration(
            suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () {
                  registerViewModel.isLockStateChange();
                },
                icon: Observer(builder: (_) {
                  return Icon(
                    registerViewModel.isLockOpen ? Icons.lock : Icons.lock_open,
                    color: context.colors.error,
                  );
                })),
            labelText: LocaleKeys.register_name.tr(),
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

  Widget buildTextFormFieldEmail(
      BuildContext context, RegisterViewModel viewModel) {
    return Padding(
      padding: context.paddingMediumVertical,
      child: TextFormField(
        controller: viewModel.emailController,
        decoration: InputDecoration(
          labelText: LocaleKeys.register_email.tr(),
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
