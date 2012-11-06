/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that [dstName] is recorded correctly.
 * @static-warning
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Undocumented.
 */

import "../../../Utils/dynamic_check.dart";

main() {
  if(isCheckedMode()) {
    try {
      int x = true;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('x', e.dstName);
    }

    try {
      bool val = 1;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('val', e.dstName);
    }

    try {
      String str = true;
      Expect.fail("TypeError is expected");
    } on TypeError catch(e) {
      Expect.equals('str', e.dstName);
    }
  }
}
