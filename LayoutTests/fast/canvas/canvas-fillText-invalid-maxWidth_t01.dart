/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Series of tests to ensure that fillText() does not display any
 * text when maxWidth is invalid.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement('canvas');
  var ctx = canvas.getContext('2d');
  var canvasWidth = 100;
  var canvasHeight = 50;
  canvas.width = canvasWidth;
  canvas.height = canvasHeight;

  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, canvasWidth, canvasHeight);
  ctx.font = '35px Arial, sans-serif';

  debug("Test canvas.fillText() with maxWidth zero");
  ctx.fillStyle = '#f00';
  ctx.fillText("fail fail fail fail fail", 5, 35, 0);

  var imageData = ctx.getImageData(0, 0, canvasWidth, canvasHeight);
  var w = imageData.width, h = imageData.height, d = imageData.data;
  for (var i = 0; i < h; ++i) {
    for (var j = 0; j < w; ++j) {
      if (d[4 * (w * i + j) + 0] != 0) shouldBe(d[4 * (w * i + j) + 0], 0); 
      if (d[4 * (w * i + j) + 1] != 255) shouldBe(d[4 * (w * i + j) + 1], 255); 
      if (d[4 * (w * i + j) + 2] != 0) shouldBe(d[4 * (w * i + j) + 2], 0); 
      if (d[4 * (w * i + j) + 3] != 255) shouldBe(d[4 * (w * i + j) + 3], 255);
    }
  }

  ctx.fillStyle = '#0f0';
  ctx.fillRect(0, 0, canvasWidth, canvasHeight);
  debug("Test canvas.fillText() with maxWidth -1");
  ctx.fillStyle = '#f00';
  ctx.fillText("fail fail fail fail fail", 5, 35, -1);

  imageData = ctx.getImageData(0, 0, canvasWidth, canvasHeight);
  w = imageData.width; h = imageData.height; d = imageData.data;
  for (var i = 0; i < h; ++i) {
    for (var j = 0; j < w; ++j) {
      if (d[4 * (w * i + j) + 0] != 0) shouldBe(d[4 * (w * i + j) + 0], 0); 
      if (d[4 * (w * i + j) + 1] != 255) shouldBe(d[4 * (w * i + j) + 1], 255); 
      if (d[4 * (w * i + j) + 2] != 0) shouldBe(d[4 * (w * i + j) + 2], 0); 
      if (d[4 * (w * i + j) + 3] != 255) shouldBe(d[4 * (w * i + j) + 3], 255);
    }
  }
}
