import 'dart:convert';
import 'package:cryptography/cryptography.dart';
import 'package:injectable/injectable.dart';
import 'package:glimm/core/errors/failures.dart';

@lazySingleton
class CryptoService {
  final Cipher _algorithm = AesGcm.with256bits();

  // In a real Zero-Knowledge app, this salt should be unique per user and stored separately
  // or the key should be derived from a user password not known to the server.
  // For this MVP, we are deriving it from the Firebase UID (which the server knows),
  // effectively making it "Server-Knowledge" but encrypted at rest on client.
  // To make it truly Zero-Knowledge without a separate password, we would need
  // the client to generate a random key, store it locally, and maybe encrypt it
  // with the user's Google credential (if possible) or just rely on local storage security.
  //
  // For MVP Simplicity (as per plan): Derive key from User ID.
  // We'll use a static salt for derivation.
  static const List<int> _salt = [0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8];

  Future<SecretKey> _deriveKey(String userId) async {
    final pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: 10000,
      bits: 256,
    );

    return await pbkdf2.deriveKeyFromPassword(password: userId, nonce: _salt);
  }

  Future<String> encrypt(String plaintext, String userId) async {
    try {
      final key = await _deriveKey(userId);
      final box = await _algorithm.encrypt(
        utf8.encode(plaintext),
        secretKey: key,
      );

      // Format: nonce + ciphertext + mac
      final combined = [...box.nonce, ...box.cipherText, ...box.mac.bytes];
      return base64Encode(combined);
    } catch (e) {
      throw const EncryptionFailure();
    }
  }

  Future<String> decrypt(String ciphertext, String userId) async {
    try {
      final key = await _deriveKey(userId);
      final decoded = base64Decode(ciphertext);

      // AES-GCM 256: Nonce is 12 bytes, MAC is 16 bytes
      if (decoded.length < 28) throw Exception('Invalid ciphertext');

      final nonce = decoded.sublist(0, 12);
      final macBytes = decoded.sublist(decoded.length - 16);
      final cipherBytes = decoded.sublist(12, decoded.length - 16);

      final box = SecretBox(cipherBytes, nonce: nonce, mac: Mac(macBytes));

      final decrypted = await _algorithm.decrypt(box, secretKey: key);

      return utf8.decode(decrypted);
    } catch (e) {
      throw const EncryptionFailure();
    }
  }
}
