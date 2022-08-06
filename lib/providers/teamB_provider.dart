import 'package:flutter/cupertino.dart';

class ScoreProviderB with ChangeNotifier {
  int scoreb = 0;
  int wicketsb = 0;
  int integerb = 0;
  double decimalb = 0;
  double oversb = 0;
  int countb = 1;
  late int innings;
  bool playSelectionb = true;
  int totaloversb = 0;

  void addRuns(int run) {
    scoreb = scoreb + run;
    notifyListeners();
  }

  void addWicket(int wickets) {
    if (wicketsb < 10) {
      wicketsb = wicketsb + 1;
    }
    notifyListeners();
  }

  void addBalls(int balls) {
    if (countb % 6 != 0) {
      countb++;
      decimalb = decimalb + 0.1;
      oversb = integerb + decimalb;
    } else {
      countb++;
      decimalb = 0;
      integerb++;
      oversb = integerb + decimalb;
    }

    notifyListeners();
  }

  void addBallsb() {
    if (countb % 6 != 0) {
      countb++;
      decimalb = decimalb + 0.1;
      oversb = integerb + decimalb;
    } else {
      countb++;
      decimalb = 0;
      integerb++;
      oversb = integerb + decimalb;
    }
  }
  void reset() {
    scoreb = 0;
    wicketsb = 0;
    integerb = 0;
    decimalb = 0;
    oversb = 0;
    countb = 1;
    notifyListeners();
  }
  void totalover(int over) {
    totaloversb = over;
  }
}
