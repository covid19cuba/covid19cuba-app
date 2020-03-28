import 'dart:math';

import 'package:covid19cuba/src/models/models.dart';
import 'package:covid19cuba/src/utils/utils.dart';

List<LocalNotification> getApplicationNotifications() {
  var notifications = List<LocalNotification>();
  notifications.add(
    LocalNotification(
      title: 'Lava bien tus manos',
      body: 'Con agua y jabón o desinfectante para manos a base de alcohol.',
    ),
  );
  notifications.add(
    LocalNotification(
      title: 'Cubre tu nariz y tu boca al toser o estornudar',
      body: 'Con pañuelos desechables o con tu antebrazo.',
    ),
  );
  notifications.add(
    LocalNotification(
      title: 'Evita el contacto cercano',
      body: 'Con cualquier persona con gripe o síntomas de resfrío.',
    ),
  );
  notifications.add(
    LocalNotification(
      title: 'Evita las aglomeraciones',
      body: 'Mantenga una distancia de metro y medio de otras personas '
          'para evitar el contagio.',
    ),
  );
  notifications.add(
    LocalNotification(
      title: '¿Está presentando sintomas de COVID19?',
      body: 'Por favor acuda al médico para recibir atención inmediata.',
    ),
  );
  var rng = new Random();
  for (var i = 0; i < notifications.length; i++) {
    var minutes = rng.nextInt(Constants.notificationMunitesRange);
    notifications[i].id = i;
    notifications[i].scheduledDate = DateTime.now().add(
      Duration(minutes: minutes),
    );
  }
  return notifications;
}
