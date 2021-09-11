// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return LoginResponseModel(
    data: json['data'] == null
        ? null
        : LoginDto.fromJson((json['data'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Object),
          )),
  );
}

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LoginDto _$LoginDtoFromJson(Map<String, dynamic> json) {
  return LoginDto(
    name: json['name'] as String?,
    email: json['email'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$LoginDtoToJson(LoginDto instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
    };
