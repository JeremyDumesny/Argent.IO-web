import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.model.freezed.dart';
part 'subscription.model.g.dart';

@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    String? id,
    String? userId,
    String? plan,
    DateTime? startDate,
    DateTime? endDate,
    required bool isActive,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, Object?> json) =>
      _$SubscriptionFromJson(json);
}
