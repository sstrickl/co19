/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into the top
 * level scope L by more than one import then:
 * - It is a static warning if N is used as a type annotation.
 * - In checked mode, it is a dynamic error if N is used as a type annotation
 *   and referenced during a subtype test.
 * - Otherwise, it is a compile-time error.
 * @description Checks that it is a neither an error nor a warning if two different libraries 
 * imported with empty prefixes introduce the same type name to the import namespace of A,
 * but A doesn't reference it.
 * @author rodionov
 */

import "1_Imports_A03_t01_p1_lib.dart";
import "1_Imports_A03_t01_p2_lib.dart";

main() {
}