/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test makes sure that focusable elements in canvas fallback
 * content are focusable.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div>
        <a id="link1" href="#">Link</a>
        <button id="button1">Button</button>
        <input id="text1" type="text">
        <input id="checkbox1" type="checkbox">
        <input id="radio1" type="radio">
        <input id="slider1" type="range">
        <input id="submit1" type="submit">
        <select id="combobox1"><option>1<option>2</select>
        <select id="listbox1" multiple><option>1<option>2</select>
        <textarea id="textarea1"></textarea>
        <div id="focusable1" tabindex="0">Focusable</div>
      </div>

      <canvas id="myCanvas" width="300" height="300">
        <a id="link2" href="#">Link</a>
        <button id="button2">Button</button>
        <input id="text2" type="text">
        <input id="checkbox2" type="checkbox">
        <input id="radio2" type="radio">
        <input id="slider2" type="range">
        <input id="submit2" type="submit">
        <select id="combobox2"><option>1<option>2</select>
        <select id="listbox2" multiple><option>1<option>2</select>
        <textarea id="textarea2"></textarea>
        <div id="focusable2" tabindex="0">Focusable</div>
      </canvas>

      <canvas hidden id="hiddenCanvas" width="300" height="300">
        <a id="linkInHiddenCanvas" href="#">Link</a>
      </canvas>

      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());


  var element;

  checkFocusable(id) {
    debug(id + " should be focusable.");
    element = document.getElementById(id);
    element.focus();
    shouldBeIdentical(document.activeElement, element);
    debug("");
  }

  checkFocusable("link1");
  checkFocusable("button1");
  checkFocusable("text1");
  checkFocusable("checkbox1");
  checkFocusable("radio1");
  checkFocusable("slider1");
  checkFocusable("submit1");
  checkFocusable("combobox1");
  checkFocusable("listbox1");
  checkFocusable("textarea1");
  checkFocusable("focusable1");

  checkFocusable("link2");
  checkFocusable("button2");
  checkFocusable("text2");
  checkFocusable("checkbox2");
  checkFocusable("radio2");
  checkFocusable("slider2");
  checkFocusable("submit2");
  checkFocusable("combobox2");
  checkFocusable("listbox2");
  checkFocusable("textarea2");
  checkFocusable("focusable2");

  var previousFocusedElement;

  checkNotFocusable(id) {
    debug(id + " should not be focusable.");
    previousFocusedElement = document.activeElement;
    element = document.getElementById(id);
    element.focus();
    shouldBeIdentical(document.activeElement, previousFocusedElement);
    debug("");
  }

  checkNotFocusable("linkInHiddenCanvas");
}