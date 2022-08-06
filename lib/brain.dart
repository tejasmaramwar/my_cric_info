import 'package:flutter/material.dart';



double overs = 0.0;
int integer = 0;
double decimal = 0;
void showOvers() {
  int count = 0;
  while (overs <= 1.9) {
    count++;
    if (count % 6 != 0) {
      decimal = decimal + 0.1;
      overs = integer + decimal;
      print(overs);
    } else {
      decimal = 0;
      integer = integer + 1;
      overs = integer + decimal;
      print(overs);
    }
  }
}