/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [&&] operator is now short-circuit in constant and potentially
 * constant expressions. It only attempts to evaluate the second operand if the
 * first operand evaluates to [true]. This makes [false && (null as
 * String).length] a valid constant expression. The second operand expression
 * still needs to be a potentially constant expression, which is a new use of
 * potentially constant expressions outside of [const] constructor initializer
 * lists.
 * @description Checks that [&&] does not attempt to calculate the second
 * operand of [&&] operation if the first one is [false] in the constant
 * expression.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=constant-update-2018
import "../../Utils/expect.dart";

const int i = 25;

class MyClass {
  final bool b;
  const MyClass() : b = false && (null as String).length;
}

main() {
  const bool a1 = (i < 0) && 128;
  Expect.isFalse(a1);

  const bool a2 = false && "test";
  Expect.isFalse(a2);

  const MyClass c1 = MyClass();
  Expect.isFalse(c1.b);
}
