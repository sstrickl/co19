/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Int32x4 shuffle(int mask)
 * Shuffle the lane values. [mask] must be one of the 256 shuffle constants.
 * @description Checks that the lane values are shuffled correctly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var iv = new Int32x4(0, 1, 2, 3);
  for (int x = 0; x < 4; ++x) {
    for (int y = 0; y < 4; ++y) {
      for (int z = 0; z < 4; ++z) {
        for (int w = 0; w < 4; ++w) {
          int mask = w << 6 | z << 4 | y << 2 | x;
          var res = iv.shuffle(mask);
          Expect.equals(x, res.x);
          Expect.equals(y, res.y);
          Expect.equals(z, res.z);
          Expect.equals(w, res.w);
        }
      }
    }
  }
}
