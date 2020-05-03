import 'package:json_annotation/json_annotation.dart';

import 'package:covid19cuba/src/models/models.dart';

part 'effective_reproductive_number.g.dart';

@JsonSerializable()
class EffectiveReproductiveNumber {
  ItemDoubleList upper;
  ItemDoubleList value;
  ItemDoubleList lower;
  ItemDateList date;

  EffectiveReproductiveNumber();

  factory EffectiveReproductiveNumber.fromJson(Map<String, dynamic> json) =>
      _$EffectiveReproductiveNumberFromJson(json);

  Map<String, dynamic> toJson() => _$EffectiveReproductiveNumberToJson(this);
}
