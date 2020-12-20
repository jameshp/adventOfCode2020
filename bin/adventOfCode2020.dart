
import 'dart:async';

import 'package:adventOfCode2020/day1.dart' as day1;
import 'package:adventOfCode2020/day10.dart';
import 'package:adventOfCode2020/day2.dart';
import 'package:adventOfCode2020/day3.dart';
import 'package:adventOfCode2020/day4.dart';
import 'package:adventOfCode2020/day5.dart';
import 'package:adventOfCode2020/day6.dart';
import 'package:adventOfCode2020/day7.dart';
import 'package:adventOfCode2020/day8.dart';
import 'package:adventOfCode2020/day9.dart'; 

void main(List<String> arguments) {
  var s = Stopwatch()..start();
  
  //Day 1
  print('Day 1 solution:');
  day1.day1_1();
  day1.day1_2();

  //Day 2
  var validCount;
  validCount = day2_1('inputs/day2_1.txt');
  print('Day 2 1 - Valid Passwords rule 1: $validCount');

  var validCount2; 
  validCount2 = day2_2('inputs/day2_1.txt');
  print('Day 2 2 - Valid Passwords rule 2: $validCount2');

  //Day 3
  var trees = day3_1('inputs/day3_1.txt');
  print('Day 3 1 - Trees found: $trees');

  var trees2 = day3_2('inputs/day3_1.txt');
  print('Day 3 2 - Trees found for all slopes: $trees2');

  //Day 4
  var validPassports = day4_1('inputs/day4_1.txt');
  print('Day 4 1 - Valid passports found: $validPassports');

  var validPassports2 = day4_2('inputs/day4_1.txt');
  print('Day 4 2 - Valid passports found: $validPassports2');

  //Day 5
  var highestSeatId = day5_1('inputs/day5_1.txt');
  print('Day 5 1 - Highest seat Id: $highestSeatId');

  var mySeatId = day5_2('inputs/day5_1.txt');
  print('Day 5 2 - My seat Id: $mySeatId');


  //Day6
  var totalYesCount = day6_1('inputs/day6_1.txt');
  print('Day 6 1 - Total yes count: $totalYesCount');

  var everyoneInGroupYesCount = day6_2('inputs/day6_1.txt');
  print('Day 6 2 - Everyone in group yes count: $everyoneInGroupYesCount');

  //Day7
  var bagsWithAtLeastOnShinyGold = day7_1('inputs/day7_1.txt');
  print('Day 7 1- Bags with at least one shiny gold bag: $bagsWithAtLeastOnShinyGold');

  var bagsInShinyGoldBag = day7_2('inputs/day7_1.txt');
  print('Day 7 2 - Bags in shiny gold bag: $bagsInShinyGoldBag');

  //Day8
  var accumulatorValue = day8_1('inputs/day8_1.txt');
  print('Day 8 1 - Loop index detected: $accumulatorValue');

  var accumulatorValueFinished = day8_2('inputs/day8_1.txt');
  print('Day 8 2 - Finished index detected: $accumulatorValueFinished');

  //Day9
  var xmasWeakness = day9_1('inputs/day9_1.txt', 25);
  print('Day 9 1 - No sum found for: $xmasWeakness');
  
  //var xmasWeakness2_test = day9_2('inputs/day9_1_test.txt', 127); 
  //print('Test Value for min max value sum is: $xmasWeakness2_test');
  var xmasWeakness2 = day9_2('inputs/day9_1.txt', 88311122); //88311112 is reslut of day9_1
  print('Day 9 2 - Value for min max value sum is: $xmasWeakness2');
  
  var joltMultiplier = day10_1('inputs/day10_1.txt');
  print('Day 10 1 - JoltMultiplier: $joltMultiplier');

  var joltOptions = day10_2('inputs/day10_1.txt');
  print('Day 10 2 - Options found: $joltOptions');

  print('All Days executed in ${s.elapsed}');
}

void measureFunction(Function() f){
  var s = Stopwatch()..start();
  f.call();
  print('${f.toString()} executed in ${s.elapsed}');
}