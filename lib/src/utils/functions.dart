int getInt(dynamic value) {
  if(value is String) return int.parse(value);
  return value;
}