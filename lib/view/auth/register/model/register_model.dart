import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends INetworkModel<RegisterModel> {
  final String? email;
  final String? password;
  final String? name;

  RegisterModel({this.email, this.password, this.name});

  @override
  RegisterModel fromJson(Map<String, Object?> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  Map<String, Object?> toJson() {
    return _$RegisterModelToJson(this);
  }
}
