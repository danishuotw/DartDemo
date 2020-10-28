import 'package:flutter/material.dart';

class NullSafety {
  void printVariable() {
//     String name; nonnullable
//     name = 'Shuo';
//     name = null; //💥

    String? name;
    name = 'Shuo';
    name = null; // 👌
    print(name);
  }

  void unwrapValue() {
    int? aNullableInt = 2;
    int value = aNullableInt!; // `aNullableInt!` is an int.
  }

  int definitelyInt(int? aNullableInt) {
    if (aNullableInt == null) {
      return 0;
    }
    return aNullableInt; // Can't be null!
  }
}

extension OptionalParameter on NullSafety {
// void printAbs({int value}) { // 💥
//   print(value.abs());
// }

  void printAbs1({required int value}) {
    print(value.abs());
  }

  void printAbs2({int? value}) {
    print(value?.abs());
  }

  void printAbs3({int value = 1}) {
    print(value.abs());
  }
}

void main() {
  var nullSafety = NullSafety();
  nullSafety.printVariable();
  nullSafety.unwrapValue();
  nullSafety.definitelyInt(123);

  nullSafety.printAbs1(value: 123);
  nullSafety.printAbs2(value: 123);
  nullSafety.printAbs3(value: 123);
}
