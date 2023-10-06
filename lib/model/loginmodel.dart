import 'package:freezed_annotation/freezed_annotation.dart';
part 'loginmodel.g.dart';
part 'loginmodel.freezed.dart';

@freezed
class LoginModel with _$LoginModel{
  const factory LoginModel({
    String? mobile,
    String? password,
    String? token,
    String? oneSignalID,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) => _$LoginModelFromJson(json);
}