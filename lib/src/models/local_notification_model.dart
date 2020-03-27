class LocalNotification {
  int id = 0;
  String title;
  String body;
  DateTime scheduledDate;

  LocalNotification({
    this.id = 0,
    this.scheduledDate,
    this.title,
    this.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'scheduledDate': scheduledDate,
      'title': title,
      'body': body,
    };
  }
}
