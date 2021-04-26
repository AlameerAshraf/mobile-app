
import 'package:weds360/pages/guest_list/models/age_category.dart';
import 'package:weds360/pages/guest_list/models/invitation_stutes.dart';

class GuestModel {
  String name;
  String email;
  String phone;
  AgeCategory age;
  InvitationStatus invitationStatus;

  GuestModel({
    this.name,
    this.email,
    this.phone,
    this.age,
    this.invitationStatus = InvitationStatus.INVITED,
  });
}
