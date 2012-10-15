/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if om+j is not null
 * and the actual type of qj is not a supertype of the type of om+j,  j from 1 to l.
 * @description Checks that it is a dynamic type error when an actual argument is not
 * null and its actual type (Dynamic) is not a subtype of the corresponding
 * named parameter's type (int).
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3223
 */

#import("../../../Utils/dynamic_check.dart");

func(int p1, int p2, [int np1, int np2, int np3]) {}

main() {
  var thirdParam = true;
  checkTypeError( () {
    func(1, 2, np1: 1, np2: 2, np3:thirdParam);
  });
}