import 'package:fb_sqlit/contant/feild.dart';

class User {
  String? uemail;
  String? upw;

  User({this.uemail, this.upw});
  Map<String, dynamic> toJson() {
    return {fuemail!: uemail, fupw!: upw};
  }

  User.fromJson(Map<String, dynamic> res) {
    uemail = res[fuemail];
    upw = res[fupw];
  }
}
