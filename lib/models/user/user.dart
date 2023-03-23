import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

UserN userNFromJson(dynamic str) => UserN.fromJson(str);

@freezed
abstract class UserN with _$UserN {
  factory UserN(
      {required String Number,
      required Map<String, int> referralOffer,
      required String referralCode}) = _UserN;

  factory UserN.fromJson(Map<String, dynamic> json) => _$UserNFromJson(json);
}
