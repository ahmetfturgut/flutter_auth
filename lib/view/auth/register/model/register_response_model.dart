import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel extends INetworkModel<RegisterResponseModel> {
  final String? token;

  RegisterResponseModel({this.token});

  IErrorModel? get error => null;

  @override
  RegisterResponseModel fromJson(Map<String, Object?> json) {
    return _$RegisterResponseModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RegisterResponseModelToJson(this);
  }
}
