import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_basket/models/address/address.dart';
import '../product/products.dart';
part 'subscription.freezed.dart';
part 'subscription.g.dart';

List<Subscription> subscriptionFromJson(dynamic str) =>
    List<Subscription>.from((str).map((e) => Subscription.fromJson(e)));

@freezed
abstract class Subscription with _$Subscription {
  factory Subscription({
    required Product product,
    required Address address,
    required int quantity,
    required DateTime startDate,
    required DateTime endDate,
    required bool subscriptionStatus,
    required String subscriptionId,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}
