import 'dart:io';

List<String> parseFile(String fileName) {
  var f = File(fileName);
  return f.readAsLinesSync();
}

int moveRight = 3; 
int moveDown = 1; 

int day3_1(String fileName){
  var treeLines = parseFile(fileName);
  return treeCount(3, 1, treeLines);
}

int day3_2(String fileName){
  var treeLines = parseFile(fileName);
  var p1 = treeCount(1, 1, treeLines);
  var p2 = treeCount(3, 1, treeLines);
  var p3 = treeCount(5, 1, treeLines);
  var p4 = treeCount(7, 1, treeLines);
  var p5 = treeCount(1, 2, treeLines);
  var multiplied = p1 * p2 * p3 * p4 * p5; 
  print ('Trees $p1, $p2, $p3, $p4, $p5 found, multiplied $multiplied');
  return multiplied; 
}

int treeCount(int moveRight, int moveDown, List<String> treeLines){
  var p= PositionState();
  do {
    p.fly(treeLines, moveRight, moveDown);
  }while(!p.finished);
  return p.treeCount;
}

class PositionState{
  int rowIndex = 0; 
  int columnIndex = 0; 
  int treeCount = 0; 
  bool finished = false; 
  

  PositionState fly(List<String> treeLines, int moveRight, int moveDown){
    //moveright
    columnIndex = (columnIndex + moveRight) % treeLines[0].length;
    rowIndex = rowIndex + moveDown; 
    if (treeLines[rowIndex][columnIndex] == '#') treeCount++; 
    if (rowIndex == treeLines.length-1) {
      finished = true; 
    }
    return this; 
  }

}


