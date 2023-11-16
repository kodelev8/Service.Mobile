import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:person_portal/model/person_profile_model.dart';

class PersonProfileController extends GetxController {
  var  profile = PersonProfileModel().obs;

  String maskedSofiNumber() {
    var sofiNumber = profile.value.sofiNr ?? '';

    if (sofiNumber.length == 9) {
      return '${sofiNumber.substring(0, 2)}***${sofiNumber.substring(sofiNumber.length - 4)}';
    }

    return '';
  }
}