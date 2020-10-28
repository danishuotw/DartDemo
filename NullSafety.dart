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

class LateKeyword {
  /// The late keyword has two effects:
// 1. The analyzer doesn’t require you to immediately initialize a late variable to a non-null value.
  late final textEditingController = TextEditingController();

// The runtime lazily initializes the late variable. For example, if a non-nullable instance variable must be calculated, adding the late modifier delays the calculation until the first use of the instance variable.
  late final int x;

  LateKeyword() {
    x = 5;
  }

// Static variable
  static late int global;
}

// To handle calculation
class IntProvider {
  late int aRealInt;

  IntProvider() {
    aRealInt = calculate();
  }

  int calculate() {
    return 1 + 1;
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
