class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class InvalidSourceException implements Exception {
  final String message;

  InvalidSourceException(this.message);
}

class ParseException implements Exception {
  final String message;

  ParseException(this.message);
}
