
import 'dart:async';

import 'package:adventOfCode2020/day1.dart' as day1;
import 'package:adventOfCode2020/day2.dart';
import 'package:adventOfCode2020/day3.dart';
import 'package:adventOfCode2020/day4.dart'; 

void main(List<String> arguments) {
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

}

void measureFunction(Function() f){
  var s = Stopwatch()..start();
  f.call();
  print('${f.toString()} executed in ${s.elapsed}');
}