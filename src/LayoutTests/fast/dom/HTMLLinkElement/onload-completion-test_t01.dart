/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 * This test verifies that at the time a body onload function is
 * called that the subresources of this page (in particular the image)
 * are already loaded.  The page verifies that the image has the expected
 * dimensions at the time of the onload event, and prints its result
 * based on that.  This is a regression test for a bug introduced by the
 * patch for bug 3652.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var root = '/root_dart/tests/co19/src/LayoutTests/fast/dom/HTMLLinkElement';

  document.body.setInnerHtml('''
    <img id=nick src="$root/resources/nick.jpg">
    ''', treeSanitizer: new NullTreeSanitizer());

  window.onLoad.listen((_) {
    var nick=document.getElementById('nick');
    shouldBe(nick.naturalWidth, 320);
    shouldBe(nick.naturalHeight, 240);
    asyncEnd();
  });

  asyncStart();
}
