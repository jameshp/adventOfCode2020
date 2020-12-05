import 'package:adventOfCode2020/day1.dart';
import 'package:adventOfCode2020/day2.dart';
import 'package:adventOfCode2020/day4.dart';
import 'package:test/test.dart';

void main() {
  test('day2_1 validate new', () {
    expect(Password.isValidPasswordOutDatedRule(1, 3, 'a', 'abcde'), true);
    expect(Password.isValidPasswordOutDatedRule(1, 3, 'b', 'cdefg'), false);
    expect(Password.isValidPasswordOutDatedRule(2, 9, 'c', 'ccccccccc'), true);
  });

  test('day 4 validate birthyear', () {
    expect(isValidBirthYear('2002'), true);
    expect(isValidBirthYear('2003'), false);
    expect(isValidBirthYear('1920'), true);
    expect(isValidBirthYear('1919'), false);
    expect(isValidBirthYear('192'), false);
    expect(isValidBirthYear('19233'), false);
  });

  test('day 4 valid heights', () {
    expect(isValidHeight('190'), false);
    expect(isValidHeight('60in'), true);
    expect(isValidHeight('190cm'), true);
    expect(isValidHeight('190in'), false);
  });

  test('day 4 valid hair color', () {
    expect(isValidHairColor('#123abc'), true);
    expect(isValidHairColor('#123abz'), false);
    expect(isValidHairColor('123abc'), false);
  });

  test('day 4 valid eye color', () {
    expect(isValidEyeColor('brn'), true);
    expect(isValidEyeColor('blu'), true);
    expect(isValidEyeColor('wat'), false);
  });

  test('day 4 is valid pid', () {
    expect(isValidPid('000000001'), true);
    expect(isValidPid('0000000011'), false);
    expect(isValidPid('0123456789'), false);
    expect(isValidPid('123456789'), true);
    expect(isValidPid('12345678A'), false);
  });
}
