/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A top level variable marked final must be initialized to a compile-time 
 * constant or a compile-time error occurs. 
 * @description Checks that a top level variable marked final may be initialized to 
 * a compile-time constant.
 * @author vasya
 * @reviewer iefremov
 */

final int i = -100;
final bool b = false;
final String s = "string";
final double pi = Math.PI;
final List l = const [0,1,2,3];
final Map m = const {'a': 1, 'b': 2};
final String e = "OneTwo";

main() {
  Expect.isTrue(-100 === i);
  Expect.isTrue(false === b);
  Expect.isTrue("string" === s);
  Expect.isTrue(Math.PI === pi);
  Expect.isTrue(const [0,1,2,3] === l);
  Expect.isTrue(const {'a': 1, 'b': 2} === m);
  Expect.isTrue("OneTwo" === e);
}

