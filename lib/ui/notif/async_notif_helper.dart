import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void showProgressNotif({required Future future, String caption = "Loading..."}) {
  final entry = showSimpleNotification(
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(caption),
        const CircularProgressIndicator()
      ],
    ),
    autoDismiss: false,
    position: NotificationPosition.bottom
  );

  future.then(
      (_) => entry.dismiss(animate: true)
  );
}