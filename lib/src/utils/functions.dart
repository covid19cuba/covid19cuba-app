int getInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}
