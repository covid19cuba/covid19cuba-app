import 'package:json_annotation/json_annotation.dart';

part 'pesquisador_model.g.dart';

@JsonSerializable()
class PesquisadorModel {
  String url;
  String javascript;
  String contains;

  PesquisadorModel();

  factory PesquisadorModel.fromJson(Map<String, dynamic> json) =>
      _$PesquisadorModelFromJson(json);

  Map<String, dynamic> toJson() => _$PesquisadorModelToJson(this);
}
