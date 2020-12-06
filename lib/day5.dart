

import 'dart:io';

int day5_1(String fileName){
  var seatCodes = parseFile(fileName);
  var seatIDs =[];
  for (var code in seatCodes) {
    var seatId = calcRow(code) * 8 + calcSeat(code);
    seatIDs.add(seatId);
    
  }
  seatIDs.sort();
  return seatIDs.last;
}

int day5_2(String fileName){
  var seatCodes = parseFile(fileName);
  var seatIDs =[];
  for (var code in seatCodes) {
    var seatId = calcRow(code) * 8 + calcSeat(code);
    seatIDs.add(seatId);
    
  }
  seatIDs.sort();
  for (var i = 0; i < seatIDs.length; i++) {
    if (seatIDs[i]+1 != seatIDs[i+1]){
      return seatIDs[i]+1;
    }
  }
  //return seatIDs.last;
}

///returns list of seatcodes
List<String> parseFile(String fileName) {
  var f = File(fileName);
  return f.readAsLinesSync();
}

int calcRow(String seatcode){
  String code = seatcode.substring(0, 7);
  code = code.replaceAll('B', '1'); 
  code = code.replaceAll('F', '0');
  return int.parse(code, radix: 2);
}

int calcSeat(String seatcode){
  String code = seatcode.substring(7);
  code = code.replaceAll('R', '1'); 
  code = code.replaceAll('L', '0');
  return int.parse(code, radix: 2);
}