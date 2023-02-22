import 'package:freezed_annotation/freezed_annotation.dart';
part 'selectedaddress.freezed.dart';
part 'selectedaddress.g.dart';

@freezed
abstract class SelectedAddress with _$SelectedAddress {
  factory SelectedAddress(
      {@Default('') String Flat_FLoor_Tower,
      @Default('') String Street_Society,
      @Default('') String Recipients_Name,
      @Default('') String City,
      @Default('') String Pincode}) = _SelectedAddress;

  factory SelectedAddress.fromJson(Map<String, dynamic> json) =>
      _$SelectedAddressFromJson(json);
}
