int getInt(dynamic value) {
  return value is String ? int.parse(value) : value;
}

DateTime dateTimeFromJson(String dateTime) {
  if (dateTime == null) {
    return null;
  }
  var year = int.parse(dateTime.split('/')[0]);
  var month = int.parse(dateTime.split('/')[1]);
  var day = int.parse(dateTime.split('/')[2]);
  return DateTime(year, month, day);
}

String dateTimeToJson(DateTime dateTime) {
  if (dateTime == null) {
    return null;
  }
  return '${dateTime.year}/${dateTime.month}/${dateTime.day}';
}
