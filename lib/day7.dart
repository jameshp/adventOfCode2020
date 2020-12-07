import 'dart:io';

List<String> parseFile(String fileName) {
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  return lines;
}

///Parser for each rule line
///parser has 3 states - mainkey parsing, key and value parsing (for all key value pairs)
Map<String, Map<String, int>> parseLine(String line) {
  //dotted salmon bags contain 2 dark lavender bags, 1 muted red bag, 1 vibrant magenta bag.
  var words = line.split(' ');
  var mainKey = '';
  var mainKeyParsing = true;
  var valueParsing = false;
  var keyParsing = false;
  Map<String, int> tempKVPairs = {};
  int tempValue;
  String tempKey = '';
  for (var w in words) {
    if (mainKeyParsing) {
      if (w.contains('bags')) continue;
      if (w.startsWith('contain')) {
        mainKeyParsing = false;
        valueParsing = true;
      }
      if (mainKeyParsing) {
        mainKey += w;
      }
    }
    if (valueParsing) {
      if (w == 'no') {
        break; 
      }
      if (int.tryParse(w) != null) {
        tempValue = int.tryParse(w);
        keyParsing = true;
        continue;
      }
    }
    if (keyParsing) {
      if (w.startsWith('bag')) {
        tempKVPairs[tempKey] = tempValue;
        tempKey = '';
        tempValue = null;
        continue;
      } else {
        tempKey += w;
      }
    }
  }
  return {mainKey: tempKVPairs};
}


int day7_1(String fileName){
  var lines = parseFile(fileName);
  Map<String, Map<String, int>> rules = {};
  for (var l in lines){
    var r= parseLine(l);
    rules.addAll(r);
  }
  var count = findBagsContaining("shinygold", rules); 
  return count.length;
  
}

Set<String> findBagsContaining(String color, Map<String, Map<String, int>> rules){
  Set<String> bags = {}; 
  rules.forEach((ruleKey, Map<String,int>value) {
    if (value.containsKey(color)){
      //print("Searching $color - found $ruleKey : $value");
      bags.add(ruleKey); 
      bags.addAll(findBagsContaining(ruleKey, rules));
    }
  });
  return bags; 
}


int day7_2(String fileName){
  var lines = parseFile(fileName);
  Map<String, Map<String, int>> rules = {};
  for (var l in lines){
    var r= parseLine(l);
    rules.addAll(r);
  }
  var count = findBagsInColor('shinygold', rules); 
  return count;
}

int findBagsInColor(String color, Map<String, Map<String, int>> rules){
  int count = 0; 
  var start = rules[color];
  //print("Starting at $start");
  start.forEach((key, value) {
    //print('$key : $value');
    count += value; 
    var tempcount = findBagsInColor(key, rules);
    //print('Bags in color $key found: $tempcount - new count is $count + ${tempcount*value}');
    count += tempcount * value; 
  });
  //print("returning $count");
  return count; 
}