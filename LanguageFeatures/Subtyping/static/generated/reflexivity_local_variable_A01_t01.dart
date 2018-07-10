/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 is the same type as T0 then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
import '../../utils/common.dart';

class T {}

T t0Instance = new T();
T t1Instance = new T();




class LocalVariableTest {

  LocalVariableTest() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  static staticTest() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  test() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }
}

main() {
  foo() {
    T t1 = t0Instance;
    t1 = t0Instance;
  }

  T t1 = t0Instance;
  t1 = t0Instance;
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
