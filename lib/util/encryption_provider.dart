import 'package:encrypt/encrypt.dart';

class EncryptionProvider {
  static final _key = "Y0FlYCd1KXozTjdmSCx6Xw==";
  static final _encrypter = Encrypter(AES(Key.fromBase64(_key.toString()), mode: AESMode.ecb));

  static Encrypted encrypt(String text) {
    final encrypted = _encrypter.encrypt(text);

    return encrypted;
  }

  static String decrypt(Encrypted encrypted) {
    final decrypted = _encrypter.decrypt(encrypted);

    return decrypted;
  }
}