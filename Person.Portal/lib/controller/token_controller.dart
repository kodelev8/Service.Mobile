import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenController extends GetxController {
  var bearerToken = ''.obs;
  var refreshToken = ''.obs;
  var userName = ''.obs;
  var apiKey = ''.obs;

  void clearTokens(){
    bearerToken.value = '';
    refreshToken.value = '';
    userName.value = '';
    apiKey.value = '';
  }

  String getClaims(String claimsId){
    var claims = JwtDecoder.decode(bearerToken.value);
    return claims[claimsId] ?? '';
  }

  bool isValidToken(){
    return JwtDecoder.isExpired(bearerToken.value) == false;
  }
}
