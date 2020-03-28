import 'dart:math';

import 'package:covid19cuba/src/models/local_notification_model.dart';
import '../utils/utils.dart';

List<LocalNotification> getApplicationNotifications() {
  List notifications = List<LocalNotification>();
  notifications.add(LocalNotification(
    title: 'Lava bien tus manos',
    body: 'Con agua y jabón o deseinfectante para manos a base de alcohol.',
  ));
  notifications.add(LocalNotification(
    title: 'Cubre tu nariz y tu boca al toser o estornudar',
    body: 'Con pañuelos desechables o on tu antebrazo.',
  ));
  notifications.add(LocalNotification(
    title: 'Evita el contacto cercano',
    body: 'Con cualquier persona con gripe o síntomas de resfrío.',
  ));
  notifications.add(LocalNotification(
    title: 'Evita las aglomeraciones',
    body:
        'Mantenga una distancia de metro y medio de otras personas para evitar el contajio.',
  ));
  var rng = new Random();
  for (var i = 0; i < notifications.length; i++) {
    int minutes = rng.nextInt(Constants.notificacionMunitesRange);
    notifications[i].id = i;
    notifications[i].scheduledDate =
        DateTime.now().add(Duration(minutes: minutes));
    print(notifications[i].toJson());
  }
  return notifications;
}
