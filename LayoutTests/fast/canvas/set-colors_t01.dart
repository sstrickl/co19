/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of various canvas graphics context calls for setting colors.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  dynamic canvas = document.createElement("canvas");
  var context = canvas.getContext('2d');

  clear()
  {
    context.clearRect(0, 0, canvas.width, canvas.height);
  }

  hex(number)
  {
    var hexDigits = "0123456789abcdef";
    return hexDigits[number >> 4] + hexDigits[number & 0xF];
  }

  pixel()
  {
    var imageData = context.getImageData(0, 0, 1, 1);
    if (imageData.data[3] == 255)
      return "#" + hex(imageData.data[0]) + hex(imageData.data[1]) + hex(imageData.data[2]);
    if (imageData.data[3] == 0)
      return "rgba(${imageData.data[0]}, ${imageData.data[1]}, ${imageData.data[2]}, 0.0)";
    return "rgba(${imageData.data[0]}, ${imageData.data[1]}, ${imageData.data[2]}, ${(imageData.data[3] / 255)})";
  }

  testFillStyle(string)
  {
    clear();
    context.fillStyle = "black";
    context.fillStyle = string;
    context.fillRect(0, 0, 1, 1);
    return pixel();
  }

  testFillGradient(string)
  {
    clear();
    context.fillStyle = "black";
    var gradient = context.createLinearGradient(0, 0, 1, 1);
    gradient.addColorStop(0, string);
    gradient.addColorStop(1, string);
    context.fillStyle = gradient;
    context.fillRect(0, 0, 1, 1);
    return pixel();
  }

  testStrokeStyle(string)
  {
    clear();
    context.lineWidth = 5;
    context.strokeStyle = "black";
    context.strokeStyle = string;
    context.strokeRect(2, 2, 10, 10);
    return pixel();
  }

  testStrokeGradient(string)
  {
    clear();
    context.lineWidth = 5;
    context.strokeStyle = "black";
    var gradient = context.createLinearGradient(0, 0, 1, 1);
    gradient.addColorStop(0, string);
    gradient.addColorStop(1, string);
    context.strokeStyle = gradient;
    context.strokeRect(2, 2, 10, 10);
    return pixel();
  }

  var transparent = "rgba(0, 0, 0, 0.0)";
  var red = "#ff0000";
  var green = "#00ff00";
  var blue = "#0000ff";
  var white = "#ffffff";
  var translucentRed = "rgba(255, 0, 0, 0.8)";
  var translucentGreen = "rgba(0, 255, 0, 0.8)";
  var translucentBlue = "rgba(0, 0, 255, 0.8)";
  var translucentWhite = "rgba(255, 255, 255, 0.8)";

  shouldBe(testFillStyle('transparent'), transparent);
  shouldBe(testFillStyle('blue'), blue);
  shouldBe(testFillStyle('#FF0000'), red);
  shouldBe(testFillStyle('#f00'), red);
  shouldBe(testFillStyle('rgb(255, 0, 0)'), red);
  shouldBe(testFillStyle('rgba(255, 0, 0, 1)'), red);
  shouldBe(testFillStyle('rgba(255, 0, 0, 0.8)'), translucentRed);
  shouldBe(testFillStyle('rgba(255, 0, 0, 0)'), transparent);
  shouldBe(testFillGradient('transparent'), transparent);
  shouldBe(testFillGradient('blue'), blue);
  shouldBe(testFillGradient('#FF0000'), red);
  shouldBe(testFillGradient('#f00'), red);
  shouldBe(testFillGradient('rgb(255, 0, 0)'), red);
  shouldBe(testFillGradient('rgba(255, 0, 0, 1)'), red);
  shouldBe(testFillGradient('rgba(255, 0, 0, 0.8)'), translucentRed);
  shouldBe(testFillGradient('rgba(255, 0, 0, 0)'), transparent);

  shouldBe(testStrokeStyle('transparent'), transparent);
  shouldBe(testStrokeStyle('blue'), blue);
  shouldBe(testStrokeStyle('#FF0000'), red);
  shouldBe(testStrokeStyle('#f00'), red);
  shouldBe(testStrokeStyle('rgb(255, 0, 0)'), red);
  shouldBe(testStrokeStyle('rgba(255, 0, 0, 1)'), red);
  shouldBe(testStrokeStyle('rgba(255, 0, 0, 0.8)'), translucentRed);
  shouldBe(testStrokeStyle('rgba(255, 0, 0, 0)'), transparent);
  shouldBe(testStrokeGradient('transparent'), transparent);
  shouldBe(testStrokeGradient('blue'), blue);
  shouldBe(testStrokeGradient('#FF0000'), red);
  shouldBe(testStrokeGradient('#f00'), red);
  shouldBe(testStrokeGradient('rgb(255, 0, 0)'), red);
  shouldBe(testStrokeGradient('rgba(255, 0, 0, 1)'), red);
  shouldBe(testStrokeGradient('rgba(255, 0, 0, 0.8)'), translucentRed);
  shouldBe(testStrokeGradient('rgba(255, 0, 0, 0)'), transparent);
}
