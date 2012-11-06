/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [RangeError] if [start] or
 * [:start + length:] are out of range for [:this:].
 * @description Checks that RangeError is thrown if 
 * [:startFrom + length:] are out of range for [from].
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

void checkList(list, src, count) {
  try {
    list.setRange(0, count, src, 0);
    Expect.fail("expected RangeError");
  } on RangeError catch(ok) {}
}

void check(int dstSize, int srcSize, int count) {
  List dst = new List(dstSize);
  List src = new List(srcSize);
  checkList(dst, src, count);

  dst = new List();
  dst.length = dstSize;
  src = new List();
  src.length = srcSize;
  checkList(dst, src, count);

  dst = [];
  dst.length = dstSize;
  src = [];
  src.length = srcSize;
  checkList(dst, src, count);

  dst = new List.from([]);
  dst.length = dstSize;
  src = new List.from([]);
  src.length = srcSize;
  checkList(dst, src, count);
}

main() {
  check(2, 1, 2);
  check(44, 42, 44);
  check(60317, 1005, 60317);
}
