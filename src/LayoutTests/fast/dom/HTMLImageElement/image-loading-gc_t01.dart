/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that an image element won't be garbage collected
 * when it's loading, even if it doesn't have any references. 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";

main() {
  var root = '/root_dart/tests/co19/src/LayoutTests/fast/dom/HTMLImageElement';
    
  var image = new ImageElement();

  image.onLoad.listen((_) => asyncEnd());
    
  image.src = '$root/resources/blue_rect.jpg';
  image = null;

  asyncStart();
}
