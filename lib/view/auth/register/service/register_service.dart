import 'package:beauty/view/_product/_utilty/service_helper.dart';
import 'package:beauty/view/_product/enum/network_route_enum.dart';
import 'package:beauty/view/auth/register/model/register_model.dart';
import 'package:beauty/view/auth/register/model/register_response_model.dart';
import 'package:beauty/view/auth/register/service/IRegister_dervice.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

class RegisterService extends IRegisterService with ServiceHelper {
  RegisterService(INetworkManager manager, GlobalKey<ScaffoldState> key)
      : super(manager, key);

  @override
  Future<RegisterResponseModel?> fetchUserControl(RegisterModel model) async {
    final response =
        await manager.send<RegisterResponseModel, RegisterResponseModel>(
            NetworkRoutes.REGISTER.rawValue,
            parseModel: RegisterResponseModel(),
            method: RequestType.POST,
            data: model);

    if (response.data is RegisterResponseModel) {
      return response.data;
    } else {
      showMessage(scaffoldyKey, response.error);
    }
  }
}
