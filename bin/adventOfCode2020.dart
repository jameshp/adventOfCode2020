
import 'dart:async';

import 'package:adventOfCode2020/day1.dart' as day1;
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
  measureFunction(day1.day1_1);
  measureFunction(day1.day1_2);

  //Day 2
  print ('Day 2 solution:');
  var validCount;// = day2_1('inputs/day2_1.txt');
  measureFunction(()=>validCount = day2_1('inputs/day2_1.txt'));
  print('Valid Passwords rule 1: $validCount');

  var validCount2; 
  measureFunction(()=>validCount2 = day2_2('inputs/day2_1.txt'));
  print('Valid Passwords rule 2: $validCount2');

  //Day 3
  var trees = day3_1('inputs/day3_1.txt');
  print('Trees found: $trees');

  var trees2 = day3_2('inputs/day3_1.txt');
  print('Trees found for all slopes: $trees2');

  //Day 4
  var validPassports = day4_1('inputs/day4_1.txt');
  print('Valid passports found: $validPassports');

  var validPassports2 = day4_2('inputs/day4_1.txt');
  print('Valid passports found: $validPassports2');

  //Day 5
  var highestSeatId = day5_1('inputs/day5_1.txt');
  print('Highest seat Id: $highestSeatId');

  var mySeatId = day5_2('inputs/day5_1.txt');
  print('My seat Id: $mySeatId');


  //Day6
  var totalYesCount = day6_1('inputs/day6_1.txt');
  print('Total yes count: $totalYesCount');

  var everyoneInGroupYesCount = day6_2('inputs/day6_1.txt');
  print('Everyone in group yes count: $everyoneInGroupYesCount');

  //Day7
  var bagsWithAtLeastOnShinyGold = day7_1('inputs/day7_1.txt');
  print('Bags with at least one shiny gold bag: $bagsWithAtLeastOnShinyGold');

  var bagsInShinyGoldBag = day7_2('inputs/day7_1.txt');
  print('Bags in shiny gold bag: $bagsInShinyGoldBag');

  //Day8
  var accumulatorValue = day8_1('inputs/day8_1.txt');
  print('Loop index detected: $accumulatorValue');

  var accumulatorValueFinished = day8_2('inputs/day8_1.txt');
  print('Finished index detected: $accumulatorValueFinished');

  //Day9
  var xmasWeakness = day9_1('inputs/day9_1.txt', 25);
  print('No sum found for: $xmasWeakness');
  
  //var xmasWeakness2_test = day9_2('inputs/day9_1_test.txt', 127); 
  //print('Test Value for min max value sum is: $xmasWeakness2_test');
  var xmasWeakness2 = day9_2('inputs/day9_1.txt', 88311122); //88311112 is reslut of day9_1
  print('Value for min max value sum is: $xmasWeakness2');
  
  



  print('All Days executed in ${s.elapsed}');
}

void measureFunction(Function() f){
  var s = Stopwatch()..start();
  f.call();
  print('${f.toString()} executed in ${s.elapsed}');
}