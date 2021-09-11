import 'package:beauty/core/base/model/base_view_model.dart';
import 'package:beauty/core/constants/enums/locale_keys_enum.dart';
import 'package:beauty/core/init/network/vexana_manager.dart';
import 'package:beauty/view/auth/login/model/login_model.dart';
import 'package:beauty/view/auth/login/service/ILogin_service.dart';
import 'package:beauty/view/auth/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginService =
        LoginService(VexanaManager.instance.networkManager, scaffoldState);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginSevice() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          scaffoldState.currentState!
              // ignore: deprecated_member_use
              .showSnackBar(SnackBar(content: Text(response.data!.token!)));
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.data!.token!);
      }
    }
    isLoadingChange();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
