import 'dart:math';

class AppString {
  

  String generateRandomString(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ),
  );
}

}