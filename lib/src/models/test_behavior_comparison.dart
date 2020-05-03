import 'package:json_annotation/json_annotation.dart';

part 'test_behavior_comparison.g.dart';

@JsonSerializable()
class TestBehaviorComparison {
  String name;
  @JsonKey(name: 'test_efectivity')
  double testEffectiveness;
  @JsonKey(name: 'total_tests_per_million')
  double totalTestsPerMillion;
  int total;

  TestBehaviorComparison();

  factory TestBehaviorComparison.fromJson(Map<String, dynamic> json) =>
      _$TestBehaviorComparisonFromJson(json);

  Map<String, dynamic> toJson() => _$TestBehaviorComparisonToJson(this);
}
