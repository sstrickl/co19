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
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
body.hide-containers .container {
    display: none;
}

.container {
    width: 600px;
    height: 200px;
    -webkit-columns: 3;
    columns: 3;
    column-fill: auto;
    line-height: 20px; /* 10 lines per page */
    font-size: 16px;
    margin: 0 0 20px 0;
    padding: 0;
    overflow: hidden;
    orphans: 2;
}

.block {
    margin: 0 0 15px 0;
    padding: 0;
}

.top {
    color: red;
}

.bottom {
    color: green;
}
</style>
''';

const String htmlEL2 = r'''
    <div class="container" id="test">
        <div class="block">
            <span id="test-block-1-line-1" class="top">Block 1 Line 1</span><br>
            <span id="test-block-1-line-2">Block 1 Line 2</span><br>
            <span id="test-block-1-line-3">Block 1 Line 3</span><br>
            <span id="test-block-1-line-4">Block 1 Line 4</span><br>
            <span id="test-block-1-line-5">Block 1 Line 5</span><br>
            <span id="test-block-1-line-6">Block 1 Line 6</span><br>
            <span id="test-block-1-line-7">Block 1 Line 7</span><br>
            <span id="test-block-1-line-8" class="bottom">Block 1 Line 8</span><br>
        </div>
        <div class="block">
            <span id="test-block-2-line-1" class="top">Block 2 Line 1</span><br>
            <span id="test-block-2-line-2">Block 2 Line 2</span><br>
            <span id="test-block-2-line-3">Block 2 Line 3</span><br>
            <span id="test-block-2-line-4">Block 2 Line 4</span><br>
            <span id="test-block-2-line-5">Block 2 Line 5</span><br>
            <span id="test-block-2-line-6">Block 2 Line 6</span><br>
        </div>
    </div>
''';

void testIsFirstInColumn(containerId, blockNumber, lineNumber) {
    // Get the upper bounds of the container and line.
    var topOfContainer = document.getElementById(containerId).getBoundingClientRect().top;
    var topOfLine = document.getElementById("$containerId-block-$blockNumber-line-$lineNumber").getBoundingClientRect().top;

    shouldBeTrue((topOfContainer - topOfLine).abs() < 5, // Give 5 pixels to account for subpixel layout.
        "$containerId  Block $blockNumber Line $lineNumber");
}

void runTest(e) {
    var container = document.getElementById("test");

    document.body.offsetTop;

    container.style.border = "3px solid blue"; // Modify a property that triggers a layout.

    testIsFirstInColumn("test", 1, 1);
    testIsFirstInColumn("test", 2, 1);

    // Hide all the containers and leave just the test results for text output.
    document.body.className = "hide-containers";

    checkTestFailures();
}

void main() {
    description("""
Test if an element with orphans relayouts correctly.
The red lines of text must be at the top of the blue rectangle.
The green lines of text must be at the bottom of the blue rectangle.
""");
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.addEventListener("load", runTest, false);
}
