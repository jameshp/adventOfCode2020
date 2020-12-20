import 'dart:io';

List<int> parseFile(String fileName) {
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  var numbers = lines.map((e) => int.tryParse(e)).toList();
  return numbers;
}

int day10_1(String fileName) {
  var numbers = parseFile(fileName);
  numbers.sort();
  numbers.insert(0, 0);
  numbers.insert(numbers.length, numbers.last + 3);
  var targetJoltage = numbers.last;
  var deltas = deltaList(numbers);
  var oneCount = deltas.where((element) => element == 1).length;
  var threeCount = deltas.where((element) => element == 3).length;
  return oneCount * threeCount;
}

List<int> deltaList(List<int> numbers) {
  List<int> l = [];
  for (var i = 1; i < numbers.length; i++) {
    l.add(numbers[i] - numbers[i - 1]);
  }
  return l;
}

int day10_2(String fileName) {
  var numbers = parseFile(fileName);
  numbers.sort();
  numbers.insert(0, 0);
  numbers.insert(numbers.length, numbers.last + 3);

  var result =  findPathCounts(numbers, 0);
  return result; 
}

Map<int, int> countAtIndex = {};
int indexLookup = 0; 

int findPathCounts(List<int> numbers, int startIndex) {
  if (startIndex == numbers.length - 1) {
    return 1; //at the end of the list
  }
  if (countAtIndex.containsKey(startIndex)){
    return countAtIndex[startIndex];
  }

  var options = 0;
  for (var j = startIndex + 1; j < numbers.length; j++) {
    var delta = numbers[j] - numbers[startIndex];
    if (delta <= 3) {
      options += findPathCounts(numbers, j);
    } 
  }
  countAtIndex[startIndex] = options; 
  return options;
}
