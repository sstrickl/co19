/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  All possible constant expressions are prescribed in assertions
 * 01_Constants_A01 - 01_Constants_A14. There are no other constant expressions.
 * @description Checks that it is a compile-time error when an expression of the form e1 == e2
 * where e1 does not evaluate to a numeric, string or boolean value, is used to
 * initialize a constant variable. 
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

class A {
  const A() : a = "hello";
  final a;
}

final constList = const [
   const A() == "hello", 
];

main() {
  try {
    constList is List;
  } catch(var x) {}
}