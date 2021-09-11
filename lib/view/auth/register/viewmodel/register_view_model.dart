import 'package:beauty/core/base/model/base_view_model.dart';
import 'package:beauty/core/constants/enums/locale_keys_enum.dart';
import 'package:beauty/core/init/network/vexana_manager.dart';
import 'package:beauty/view/auth/register/model/register_model.dart';
import 'package:beauty/view/auth/register/service/IRegister_dervice.dart';
import 'package:beauty/view/auth/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late IRegisterService registerService;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? name;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    registerService =
        RegisterService(VexanaManager.instance.networkManager, scaffoldState);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    name = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchRegisterSevice() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await registerService.fetchUserControl(RegisterModel(
          email: emailController!.text,
          password: passwordController!.text,
          name: name!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          scaffoldState.currentState!
              // ignore: deprecated_member_use
              .showSnackBar(SnackBar(content: Text("başarılı")));
        } else {
          scaffoldState.currentState!
              // ignore: deprecated_member_use
              .showSnackBar(SnackBar(content: Text("hatalı")));
        }
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
