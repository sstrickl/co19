/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "dart:math" as Math;
import "../../../testharness.dart";
import "../resources/subpixel-utils.dart" as SubPixelLayout;

const String htmlEL1 = r'''
<style>
#container-border {
    border: 1px solid black; 
    margin: 10px; 
    width: 500px;
}

#container {
    font: 20px/1 Ahem, sans-serif;
    width: 500px;
    height: 300px;
    text-align: right;
  }

#float-right {
    float: right;
    position: relative;
    overflow: visible;
    shape-outside: ellipse(200px 100px at 225px 125px);
    shape-margin: 25px;
    width: 450px;
    height: 250px;
}

#svg-shape-ellipse {
    position: absolute;
    display:block;
    top: 0px;
    left: 0px;
    width: 500px;
    height: 300px;
}
</style>
''';

const String htmlEL2 = r'''
<p>The right edges of the three black squares should follow the outer ellipse boundary and each square should appear on a subsequent line.</p>
<div id="container-border">
    <div id="container">
        <div id="float-right">
            <svg id="svg-shape-ellipse" xmlns="http://www.w3.org/2000/">
                <ellipse cx="225" cy="125" rx="200" ry="100" fill="green"></ellipse>
                <ellipse cx="225" cy="125" rx="225" ry="125" fill="none" stroke="green"></ellipse>
            </svg>
        </div>
        <span id="s1">X</span></br><span id="s2">X</span><br/><span id="s3">X</span>
    </div>
</div>
<div id="console"></div>
''';

Rectangle elementRect(elementId) {
    Rectangle s = document.getElementById("container").getBoundingClientRect();
    Rectangle r = document.getElementById(elementId).getBoundingClientRect();
    return new Rectangle(r.left - s.left, r.top - s.top, r.width, r.height);
}

// You'll find the equation for the X intercept of an elliptical arc here (among other places):
// http://hansmuller-webkit.blogspot.com/2012/07/computing-horizonal-rounded-rectangle.html

String  marginEllipseRightXIntercept(y, cx, rx, ry) {
    var containerWidth = document.getElementById("container").getBoundingClientRect().width;
    var f = SubPixelLayout.snapToLayoutUnit(containerWidth - (cx + rx * Math.sqrt(1 - Math.pow((ry - y) / ry, 2))));
    return f.floor().toString();
}

// In the ".right" tests below, it's the lower edge of the 20px Ahem glyph that that defines the element rect's left edge. 
// That's why the Y coordinate in each of those tests is 20 greater than the ".top" test.
void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);

    shouldBe(elementRect('s1').top, 0);
    shouldBe(elementRect('s1').right, marginEllipseRightXIntercept(20, 225, 225, 125));
    
    shouldBe(elementRect('s2').top, 20);
    shouldBe(elementRect('s2').right, marginEllipseRightXIntercept(40, 225, 225, 125));
    
    shouldBe(elementRect('s3').top, 40);
    shouldBe(elementRect('s3').right, marginEllipseRightXIntercept(60, 225, 225, 125));

    checkTestFailures();
}