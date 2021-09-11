import 'package:beauty/view/_product/_utilty/service_helper.dart';
import 'package:beauty/view/_product/enum/network_route_enum.dart';
import 'package:beauty/view/auth/login/model/login_model.dart';
import 'package:beauty/view/auth/login/model/login_response_model.dart';
import 'package:beauty/view/auth/login/service/ILogin_service.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService with ServiceHelper {
  LoginService(INetworkManager manager, GlobalKey<ScaffoldState> key)
      : super(manager, key);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
  }
}
