import 'dart:convert';
import 'dart:io';

int day2_1(String fileName) {
  var passswords = parseFile(fileName);
  return passswords.where((Password p) => p.isValidOutDatedRule).toList().length;
}

int day2_2(String fileName){
  var passswords = parseFile(fileName);
  return passswords.where((Password p) => p.isValid).toList().length;
}

List<Password> parseFile(String fileName) {
  var f = File(fileName);
  List<Password> passwords = [];
  var lines = f.readAsLinesSync();
  for (var line in lines) {
    var parts = line.split(' ');
    var minMax = parts[0].split('-');
    var min = int.tryParse(minMax[0]);
    var max = int.tryParse(minMax[1]);
    var char = parts[1][0];
    passwords.add(Password(min, max, char, parts[2]));
  }

  return passwords;
}

class Password {
  final int first;
  final int second;
  final String char;
  final String password;
  final bool isValidOutDatedRule;
  final bool isValid;

  Password(this.first, this.second, this.char, this.password)
      : isValidOutDatedRule = isValidPasswordOutDatedRule(first, second, char, password),
        isValid = isValidPassword(first, second, char, password);

  static bool isValidPasswordOutDatedRule(int min, int max, String char, String password) {
    //var matchCount =  password.split(char).length;
    final iReg = RegExp('$char');
    var matchCount = iReg.allMatches(password).toList().length;
    if (matchCount < min || matchCount > max) {
      return false;
    }
    return true;
  }

  static bool isValidPassword(int first, int second, String char, String password) {
    int count = 0; 
    if (password[first-1].contains(char)) count++; 
    if (password[second-1].contains(char)) count++; 
    if (count != 1) return false; 
    return true; 
  }
}
