class CenterModel {
  String id;
  String name;
  String province;
  String dpacodeProvince;

  CenterModel({
    this.id,
    this.name,
    this.province,
    this.dpacodeProvince,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'nombre': name,
      'provincia': province,
      'dpacode_provincia': dpacodeProvince,
    };
  }

  static CenterModel fromJson(Map<String, dynamic> json) {
    return CenterModel(
      id: json['id'],
      name: json['nombre'],
      province: json['provincia'],
      dpacodeProvince: json['dpacode_provincia'],
    );
  }
}
