import 'package:encrypt/encrypt.dart';

class EncryptionProvider {
  static final _key = "Y0FlYCd1KXozTjdmSCx6Xw==";
  static final _encrypter = Encrypter(AES(Key.fromBase64(_key.toString()), mode: AESMode.ecb));

  static String encrypt(String text) {
    final encrypted = _encrypter.encrypt(text);
    return encrypted.base64;
  }

  static String decrypt(String encrypted) {
    final decrypted = _encrypter.decrypt64(encrypted);
    return decrypted;
  }
}
