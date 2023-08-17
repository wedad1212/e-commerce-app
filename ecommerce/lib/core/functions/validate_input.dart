import 'package:get/get.dart';

vlidatorInput(String type, int min, int max, String value) {
  if (value.isEmpty) {
    return "returnEmpty".tr ;
  }
  if (value.length < min) {
    return "${"returnMin".tr} $min";
  }
  if (value.length > max) {
    return "${"returnMax".tr} $max";
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(value)) {
      return "returnEmail".tr;
    }
  }
  if (type == 'username') {
    if (!GetUtils.isUsername(value)) {
      return "returnUsername".tr;
    }
    if (type == 'phone') {
      if (!GetUtils.isPhoneNumber(value)) {
        return "returnPhone".tr;
      }
    }
  }
}
