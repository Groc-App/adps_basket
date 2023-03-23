import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

List<Offer> offerFromJson(dynamic str) =>
    List<Offer>.from((str).map((e) => Offer.fromJson(e)));

@freezed
abstract class Offer with _$Offer {
  factory Offer(
      {required String offerId,
      required String name,
      required String description,
      required bool isUserClaimed,
      required bool isUserRedeemed,
      required double worth,
      required double number,
      required double totalUserOrder}) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}
