import 'package:beauty/view/auth/login/model/login_model.dart';
import 'package:beauty/view/auth/login/model/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class ILoginService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  ILoginService(this.manager, this.scaffoldyKey);

  Future<LoginResponseModel?> fetchUserControl(LoginModel model);
}
