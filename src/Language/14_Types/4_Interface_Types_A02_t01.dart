/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface I is a direct supertype of an interface J if I is listed in the extends
 * clause of J.
 * @description Checks that an interface listed in the extends clause of another is its supertype.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview It's currently impossible to check whether a type is a direct supertype of another
 * without some sort of reflection framework.
 */

interface I {}
interface J extends I default C {
  J();
}

class C implements J {
  J(){return new C();}
}

main() {
  Expect.isTrue(new J() is I);
}
