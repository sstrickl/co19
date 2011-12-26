/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable that has not been initialized has the initial value null (10.2).
 * @description Checks that various uninitialized variables are set to null by default.
 * @author vasya
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

class C { 
  static var a;
}

interface I { }

int global;

main() {
  var x;
  Expect.equals(null, x);
  bool y;
  Expect.equals(null, y);
  String z;
  Expect.equals(null, z);
  List l;
  Expect.equals(null, l);
  C c;
  Expect.equals(null, c);
  Expect.equals(null, C.a);
  I i;
  Expect.equals(null, i);
  Object o;
  Expect.equals(null, o);
  Expect.equals(null, global);
}

