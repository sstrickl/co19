/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double floor()
 * @description Checks that positive values less than one are rounded to zero.
 * @author pagolubev
 * @reviewer msyabro
 */

import "dart:math" as Math;


main() {
  Expect.equals(.0, .1.floor());
  Expect.equals(.0, .01.floor());
  Expect.equals(.0, 1E-100.floor());
  Expect.equals(.0, 4.9406564584124654e-324.floor()); // min subnormal
  Expect.equals(.0, 2.2250738585072014e-308.floor()); // min normal
  Expect.equals(.0, .5.floor());
  Expect.equals(.0, .9.floor());
  Expect.equals(.0, (1.0 - Math.pow(2.0, -53)).floor()); // max less than 1.0
}
