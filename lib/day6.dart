import 'dart:io';

List<String> parseFile(String fileName) {
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  return lines;
}

List<Set<String>> userGroupListSolution1(List<String> lines) {
  List<Set<String>> groups = [];
  Set<String> groupAnswers = {};
  for (var line in lines) {
    //print("$line");
    if (line.isEmpty) {
      groups.add(groupAnswers);
      groupAnswers = {};
      continue;
    }
    var items = line.split('');
    groupAnswers.addAll(items);
  }
  if (groupAnswers.isNotEmpty) {
    groups.add(groupAnswers);
  }
  return groups;
}

List<Set<String>> userGroupListSolution2(List<String> lines) {
  List<Set<String>> groups = [];
  List<Set<String>> tempAnswerList = [];
  for (var line in lines) {
    //print("$line");
    if (line.isEmpty) {
      Set<String> allYes = tempAnswerList.fold<Set<String>>(tempAnswerList.first.toSet(), (previousValue, element) => element.intersection(previousValue));
      groups.add(allYes);
      tempAnswerList = [];
      continue;
    }
    var items = line.split('').toSet();
    tempAnswerList.add(items);
  }
  if (tempAnswerList.isNotEmpty) {
    //print("Temp Answers List: $tempAnswerList");
    Set<String> allYes = tempAnswerList.fold<Set<String>>(tempAnswerList.first.toSet(), (previousValue, element) => element.intersection(previousValue));
    groups.add(allYes);
  }
  return groups;
}


int day6_1(String fileName) {
  var fileLines = parseFile(fileName);
  var groupList = userGroupListSolution1(fileLines);
  var totalCount = groupList.fold(0, (int previousValue, element) => previousValue + element.length);
  return totalCount;
}

int day6_2(String fileName) {
  var fileLines = parseFile(fileName);
  var groupList = userGroupListSolution2(fileLines);
  var totalCount = groupList.fold(0, (int previousValue, element) => previousValue + element.length);
  return totalCount;
}
