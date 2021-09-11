import 'package:beauty/view/auth/register/model/register_model.dart';
import 'package:beauty/view/auth/register/model/register_response_model.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class IRegisterService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IRegisterService(this.manager, this.scaffoldyKey);

  Future<RegisterResponseModel?> fetchUserControl(RegisterModel model);
}
