import 'package:fb_sqlit/contant/feild.dart';

class User {
  String? uemail;
  String? upw;
  String? uimg;
  String? ucap;
  User({this.uemail, this.upw, this.uimg, this.ucap});
  Map<String, dynamic> toJson() {
    return {fuemail!: uemail, fupw!: upw, fuimg!: uimg, fucap!: ucap};
  }

  User.fromJson(Map<String, dynamic> res) {
    uemail = res[fuemail];
    upw = res[fupw];
    uimg = res[fuimg];
    ucap = res[fucap];
  }
}
