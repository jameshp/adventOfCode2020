import 'dart:io';

List<int> parseFile(String fileName) {
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  var numbers = lines.map((e) => int.tryParse(e)).toList();
  return numbers;
}

day9_1(String fileName, int preambleLength) {
  var numbers = parseFile(fileName);

  int bufferSize = preambleLength;
  int startIndex = 0;
  var currentSumValue = 0;

  var sumFound = false;
  do {
    sumFound = false;
    var buffer = numbers.getRange(startIndex, startIndex + bufferSize).toList();
    buffer.sort();
    currentSumValue = numbers[startIndex + bufferSize];

    for (var i = 0; i < buffer.length; i++) {
      var x = buffer[i];
      for (var j = 0; j < buffer.length; j++) {
        if (i == j) continue;
        if (x + buffer[j] == currentSumValue) {
          //print('sum found for $currentSumValue');
          sumFound = true;
          break;
        }
      }
      if (sumFound) break;
    }
    if (sumFound) {
      startIndex++;
    } else {
      break;
    }
  } while (sumFound);
  print('No sum found for $currentSumValue');
  return currentSumValue;
}



day9_2(String fileName, int targetNumber) {
  var numbers = parseFile(fileName);

  int bufferSize = numbers.length;
  int startIndex = 0;
  

  var sumFound = false;
  var y =[];
  var total =0; 
  do {
    sumFound = false;
    var buffer = numbers; 
    for (var i = 0; i < buffer.length; i++) {
      var x = buffer[i];
      y = []; 
      for (var j = i+1; j < buffer.length; j++) {
        y.add(buffer[j]);
        total = x + y.fold(0, (a, b) => a+b);
        if (total == targetNumber) {
          y.add(x);//to have the complete list at the end
          //print('sum found for $total of $y');
          sumFound = true;
          break;
        }
        if (total > targetNumber) {
          //print('sum already to big for $targetNumber: $total of $y');
          break; 
        }
      }
      if (sumFound) break;
    }

    if (!sumFound) {
      startIndex++;
      bufferSize--; 
    } else {
      break;
    }
  } while (!sumFound);
  y.sort();
  print('Result found for $total of $y  returning ${y.first + y.last}' );
  return y.first + y.last;
}




