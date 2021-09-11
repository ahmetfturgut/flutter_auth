import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel> {
  LoginDto? data;

  LoginResponseModel({this.data});

  @override
  LoginResponseModel fromJson(Map<String, Object?> json) {
    return _$LoginResponseModelFromJson(json);
  }

  factory LoginResponseModel.fromJson(Map<String, Object> json) {
    return _$LoginResponseModelFromJson(json);
  }
  @override
  Map<String, Object?> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}

@JsonSerializable()
class LoginDto extends INetworkModel<LoginDto> {
  String? name;
  String? email;
  String? token;

  LoginDto({this.name, this.email, this.token});

  @override
  LoginDto fromJson(Map<String, Object?> json) {
    return _$LoginDtoFromJson(json);
  }

  factory LoginDto.fromJson(Map<String, Object> json) {
    return _$LoginDtoFromJson(json);
  }
  @override
  Map<String, Object?> toJson() {
    return _$LoginDtoToJson(this);
  }
}
