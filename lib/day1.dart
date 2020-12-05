List<int> amounts_test = [
  1721,
  979,
  366,
  299,
  675,
  1456,
];

List<int> amounts = [
  1844,
  1123,
  1490,
  1478,
  1108,
  1120,
  1594,
  1101,
  1831,
  1146,
  1084,
  1535,
  1016,
  1722,
  1388,
  1188,
  1351,
  1477,
  1215,
  1678,
  1159,
  1558,
  1581,
  1400,
  1550,
  1306,
  1852,
  1745,
  1224,
  1896,
  1596,
  1005,
  1499,
  1797,
  976,
  1777,
  1129,
  1601,
  1058,
  1510,
  1704,
  1818,
  1795,
  1364,
  1276,
  1362,
  1801,
  1985,
  1421,
  1311,
  1855,
  1977,
  1613,
  1951,
  2001,
  1327,
  1872,
  1517,
  1040,
  1692,
  1595,
  1769,
  1956,
  1763,
  1470,
  1898,
  1366,
  1443,
  312,
  1685,
  1014,
  1409,
  1717,
  1105,
  1290,
  1703,
  1732,
  1939,
  1790,
  1164,
  1225,
  1474,
  1713,
  1413,
  1906,
  1488,
  1931,
  1702,
  1848,
  1668,
  1737,
  1614,
  1719,
  1647,
  1171,
  1508,
  1035,
  1133,
  1179,
  1180,
  1472,
  1414,
  1659,
  1820,
  1544,
  1697,
  1175,
  1033,
  1805,
  1576,
  1196,
  1597,
  1739,
  1291,
  1103,
  1457,
  1514,
  1462,
  1619,
  1683,
  1338,
  1604,
  1372,
  1653,
  16,
  1725,
  1181,
  1952,
  1201,
  1531,
  1505,
  1912,
  1527,
  1853,
  1905,
  1833,
  1913,
  1131,
  1069,
  1537,
  1754,
  1551,
  1435,
  1914,
  1093,
  1273,
  1726,
  1094,
  1439,
  1689,
  1607,
  1646,
  1588,
  1698,
  1539,
  1493,
  1352,
  1163,
  1482,
  1044,
  1523,
  1142,
  1253,
  1250,
  1986,
  1049,
  1330,
  1219,
  1162,
  1088,
  1100,
  1532,
  1727,
  1761,
  1107,
  1916,
  1220,
  1319,
  1098,
  1431,
  1260,
  1642,
  1269,
  1102,
  1432,
  1267,
  1824,
  1658,
  1149,
  1024,
  1963,
  1498,
  1904,
  1812,
  1600,
  1773,
  1283,
  1463,
  1776,
  1406,
];

List<int> day2_test = [
  1721,
  979,
  366,
  299,
  675,
  1456,
];

void main() {
  day1_1();
  day1_2();
}

void day1_2() {
  //var amounts = day2_test;
  amounts.sort((a, b) => a.compareTo(b));
  for (int x = 0; x < amounts.length; x++) {
    for (int y = x + 1; y < amounts.length; y++) {
      if (amounts[x] + amounts[y] > 2020) break;
      for (int z = y + 1; z < amounts.length; z++) {
        if (amounts[x] + amounts[y] + amounts[z] > 2020) break;
        //print("${amounts[x]} + ${amounts[y]} + ${amounts[z]}");
        if (amounts[x] + amounts[y] + amounts[z] == 2020) {
          print('found ${amounts[x]} + ${amounts[y]} + ${amounts[z]}');
          print('Solution 2: ${amounts[x] * amounts[y] * amounts[z]}');
          return;
        }
      }
    }
  }
}

void day1_1() {
  amounts.sort((a, b) => a.compareTo(b));
  for (int i = 0; i < amounts.length; i++) {
    for (int y = 0; y < amounts.length; y++) {
      if (amounts[i] + amounts[y] > 2020) break;
      if (amounts[i] + amounts[y] == 2020) {
        print('found ${amounts[i]} + ${amounts[y]}');
        print('Solution 1: ${amounts[i] * amounts[y]}');
        return;
      }
    }
  }
}