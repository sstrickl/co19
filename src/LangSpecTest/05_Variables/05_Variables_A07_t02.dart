/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A top-level variable is implicitly static. It is a compile-time error to preface
 * a top level variable declaration with the built-in identifier (10.29) static. 
 * @description Checks that it is a compile-time error if a top level variable declaration
 * prefaces with the built-in identifier static.
 * @author kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

static var foo; // error

main() {
  try {
    foo = 1;
  } catch(var x){}
}

