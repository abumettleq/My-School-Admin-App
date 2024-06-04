import 'dart:convert'; // for utf8.encode
import 'package:crypto/crypto.dart'; // for md5

class Md5Hepler {
  Md5Hepler._();
  static Md5Hepler md5Helper = Md5Hepler._();

  String generateMd5(String input) {
    // Convert the input string into a list of bytes
    var bytes = utf8.encode(input);

    // Compute the MD5 hash
    var digest = md5.convert(bytes);

    // Return the hash as a hexadecimal string
    return digest.toString();
  }
}
