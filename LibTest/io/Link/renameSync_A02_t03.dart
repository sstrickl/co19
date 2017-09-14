/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Link renameSync(String newPath)
 * Synchronously renames this link. Returns a Link instance for the renamed
 * link.
 *
 * If newPath identifies an existing link, that link is replaced. If newPath
 * identifies an existing file or directory the operation fails and an exception
 * is thrown.
 * @description Checks that if newPath identifies an existing file the
 * operation fails and an exception is thrown.
 * @author sgrekhov@unipro.ru
 * @issue 30697
 */
import "dart:io";
import "../../../Utils/expect.dart";
import "../../../Utils/file_utils.dart";

main() {
  Link link = getTempLinkSync();
  Directory target = new Directory(link.targetSync());
  File file = getTempFileSync();

  try {
    Expect.throws(() {
      link.renameSync(file.path);
    });
    Expect.isTrue(link.existsSync());
    Expect.isTrue(file.existsSync());
  } finally {
    if (file.existsSync()) {
      file.delete(recursive: true);
    }
    if (link.existsSync()) {
      deleteLinkWithTarget(link);
    } else {
      target.delete();
    }
  }
}
