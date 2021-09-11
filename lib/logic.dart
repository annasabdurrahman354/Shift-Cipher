class Logic {
  // Caesar Cipher encryption and decryption
  String shift(String text, int key, bool encrypt) {
    String result = "";

    for (var i = 0; i < text.length; i++) {
      int ch = text.codeUnitAt(i);
      int offset = 0;
      int x;

      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0))
        offset = 97;
      else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0))
        offset = 65;
      else if (ch == ' '.codeUnitAt(0)) {
        result += " ";
        continue;
      }

      if (encrypt == true)
        x = (ch + key - offset) % 26;
      else
        x = (ch - key - offset) % 26;

      result += String.fromCharCode(x + offset);
    }
    return result;
  }
}

