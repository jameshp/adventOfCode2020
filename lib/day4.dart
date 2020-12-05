import 'dart:io';

List<Map<String, String>> parseFile(String fileName) {
  List<Map<String, String>> passPorts = [];
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  Map<String, String> tempPass = {};
  for (var line in lines) {
    //print("$line");
    if (line.isEmpty) {
      passPorts.add(tempPass);
      tempPass = {};
      continue;
    }
    var items = line.split(' ');
    for (var i in items) {
      var kvPair = i.split(':');
      tempPass[kvPair[0]] = kvPair[1];
    }
  }
  if (tempPass.isNotEmpty) {
    passPorts.add(tempPass);
  }
  return passPorts;
}

int day4_1(String fileName) {
  List<Map<String, String>> passports = parseFile(fileName);
  var valid = 0;
  var invalid = 0;
  for (var p in passports) {
    if (p.containsKey('byr') && 
        p.containsKey('iyr') && 
        p.containsKey('eyr') && 
        p.containsKey('hgt') && 
        p.containsKey('hcl') &&
        p.containsKey('ecl') &&
        p.containsKey('pid')) {
      valid++;
    } else {
      invalid++;
    }
  }
  return valid;
}

int day4_2(String fileName){
  List<Map<String, String>> passports = parseFile(fileName);
  var valid = 0;
  var invalid = 0;
  for (var p in passports) {
    if (p.containsKey('byr') && isValidBirthYear(p['byr']) &&
        p.containsKey('iyr') && isValidIssueYear(p['iyr']) &&
        p.containsKey('eyr') && isValidExpirationYear(p['eyr']) &&
        p.containsKey('hgt') && isValidHeight(p['hgt']) &&
        p.containsKey('hcl') && isValidHairColor(p['hcl']) &&
        p.containsKey('ecl') && isValidEyeColor(p['ecl']) &&
        p.containsKey('pid') && isValidPid(p['pid'])) {
      valid++;
    } else {
      invalid++;
    }
  }
  return valid;
}

bool isValidBirthYear(String birthYear){
  return isValidYear(birthYear, 4, 1920, 2002);
}

bool isValidIssueYear(String issueYear){
  return isValidYear(issueYear, 4, 2010, 2020);
}

bool isValidExpirationYear(String expirationYear){
  return isValidYear(expirationYear, 4, 2020, 2030);
}

bool isValidYear(String year, int lengh, int minValue, int maxValue){
  if (year.length != lengh) {
    return false; 
  }
  int y = int.tryParse(year) ?? 0;
  if (y < minValue || y > maxValue) {
    return false; 
  } 
  return true; 
}


bool isValidHeight(String height){
  if (height.endsWith('cm')){
    var numString = height.split('cm').first;
    var h = int.tryParse(numString) ?? 0; 
    if (h < 150 || h > 193){
      return false; 
    }
    return true; 
  }
  else if (height.endsWith('in')){
    var numString = height.split('in').first;
    var h = int.tryParse(numString) ?? 0; 
    if (h < 59 || h > 76){
      return false; 
    }
    return true; 

  }
  return false; 
}


bool isValidHairColor(String hairColor){
  var regEx = RegExp('#[0-9a-f]{6}');
  return regEx.hasMatch(hairColor);
}

bool isValidEyeColor(String color){
  var validColors = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth',];
  return validColors.contains(color);
}

bool isValidPid(String pid){
  if (pid.length != 9){
    return false; 
  }
  if (int.tryParse(pid) == null) {
    return false; 
  } 
  return true; 
}