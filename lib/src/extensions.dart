extension UpperLower on String {
  bool get isUpperCase => toUpperCase() == this;
  bool get isLowerCase => toLowerCase() == this;

  String passToTitle() {
    var list = split('');
    var result = '';

    for (var letter = 0; letter < list.length; letter++) {
      if (letter == 0) {
        result += list[letter].toUpperCase();
      } else {
        result += list[letter].toLowerCase();
      }
    }

    if (result.isEmpty) throw Exception('Result can\'t be null');

    return result;
  }
}
