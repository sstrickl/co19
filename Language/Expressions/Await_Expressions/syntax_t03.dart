/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  awaitExpression:
 *      await unaryExpression
 *
 * @description Check that it is a compile error if unaryExpression is missing
 * @compile-error
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/async_utils.dart';

f() {
  return new Future<int>.value(1);
}

test() async {
  await;
}

main() {
  asyncStart();
  test().then( (value) => asyncEnd() );
}