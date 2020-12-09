import 'dart:io';

List<String> parseFile(String fileName) {
  var f = File(fileName);
  var lines = f.readAsLinesSync();
  return lines;
}

List<Instruction> parseOperations(List<String> lines) {
  List<Instruction> instructions = [];
  for (var l in lines) {
    var arg = int.tryParse(l.substring(4));
    instructions.add(Instruction(findOpType(l), arg));
  }
  return instructions;
}

int day8_1(String fileName){
  var instructions = parseOperations(parseFile(fileName));
  var p = Program(instructions);
  p.run();
  return p.globalAccumulator; 
}

int day8_2(String fileName){  
  var instructions = parseOperations(parseFile(fileName));
  var replaceJmp = [];
  var replaceNop = [];
  for (var i = 0; i < instructions.length; i++) {
    if (instructions[i].operation == OperationType.jmp) {
      replaceJmp.add(i);
    }
    if (instructions[i].operation == OperationType.nop) {
      replaceNop.add(i);
    }
  }


  print('try replace Jmp with  No Op');
  for (var i = 0; i < replaceJmp.length; i++) {
    var tempInstructions = [...instructions];
    var replaceInstruction = tempInstructions[replaceJmp[i]];
    //print('Replacing $replaceInstruction');
    tempInstructions[replaceJmp[i]] = Instruction(OperationType.nop, replaceInstruction.argument);
    var p = Program(tempInstructions);
    p.run();
    if (p.finished) {
      return p.globalAccumulator; 
    }
  }

  print('try replace No Op with jump');
  for (var i = 0; i < replaceNop.length; i++) {
    var tempInstructions = [...instructions];
    var replaceInstruction = tempInstructions[replaceNop[i]];
    //print('Replacing $replaceInstruction');
    tempInstructions[replaceNop[i]] = Instruction(OperationType.jmp, replaceInstruction.argument);
    var p = Program(tempInstructions);
    p.run();
    if (p.finished) {
      return p.globalAccumulator; 
    }
  }


}


enum OperationType { acc, jmp, nop }

OperationType findOpType(String instruction) {
  var opType = instruction.substring(0, 3);
  switch (opType) {
    case 'acc':
      return OperationType.acc;
      break;
    case 'jmp':
      return OperationType.jmp;
      break;
    case 'nop':
      return OperationType.nop;
    default:
      throw 'no operation type found';
  }
}

class Instruction {
  final OperationType operation;
  final int argument;

  Instruction(this.operation, this.argument);

  @override
  String toString() {
    return '$operation - $argument';
  }
}

class Program {
  final List<Instruction> instructions;
  int globalAccumulator = 0;
  int instructionIndex = 0;
  List<int> visitedIndex = [];
  int loopDetectedIndex = 0;
  bool finished = false; 
  Program(this.instructions);

  void run() {
    while (true) {
      if (instructionIndex == instructions.length){
        print('we reached the end of the program at $instructionIndex - global Acc Value: $globalAccumulator');
        finished = true; 
        break;
      }

      if (visitedIndex.contains(instructionIndex)) {
        loopDetectedIndex = instructionIndex;
        print('loop detected at $loopDetectedIndex');
        break;
      } else {
        visitedIndex.add(instructionIndex);
      }

      var currentInstruction = instructions[instructionIndex];
      //print(currentInstruction);
      switch (currentInstruction.operation) {
        case OperationType.acc:
          globalAccumulator += currentInstruction.argument;
          instructionIndex++;
          break;
        case OperationType.jmp:
          instructionIndex += currentInstruction.argument;
          break;
        case OperationType.nop:
          instructionIndex++;
          break;
        default:
          throw 'unknown operation type';
      }
    }
  }
}
