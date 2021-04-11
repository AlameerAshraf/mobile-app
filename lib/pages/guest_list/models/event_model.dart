import 'package:flutter/foundation.dart';
import 'package:weds360/pages/guest_list/models/guest_model.dart';

class EventModel {
  String name;
  String location;
  String date;
  GuestModel guestModel;
  EventModel({
    @required this.name,
    @required this.location,
    @required this.date,
  });
}
