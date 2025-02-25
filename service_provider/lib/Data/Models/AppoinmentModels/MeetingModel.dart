import 'package:flutter/material.dart';

class Meeting {
  Meeting(this.id, this.eventName, this.from, this.to, this.background,
      this.isAllDay, this.customerId);

  String eventName;
  int customerId;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  int id;
}
