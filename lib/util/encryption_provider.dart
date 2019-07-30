import 'package:encrypt/encrypt.dart';
import 'package:flutter_login/config/app_constants.dart';

class EncryptionProvider {
  static final _encrypter = Encrypter(AES(Key.fromBase64(AppConstants.encryptionProviderKey), mode: AESMode.ecb));

  static String encrypt(String text) {
    final encrypted = _encrypter.encrypt(text);
    return encrypted.base64;
  }

  static String decrypt(String encrypted) {
    final decrypted = _encrypter.decrypt64(encrypted);
    return decrypted;
  }
}
