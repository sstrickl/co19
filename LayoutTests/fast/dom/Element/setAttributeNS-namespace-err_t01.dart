 /*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description setAttributeNS tests adapted from createAttributeNS which in 
 * turn were adapted from createElementNS tests attached to webkit bug 16833
 */
import "dart:html";
import "../../../../Utils/expect.dart";

main() {
  var allNSTests = [
    { 'args': [null, ""], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["", ""], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, "<div>"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, "0div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, "di v"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, "di<v"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, "-div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, ".div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["http://example.com/", "<div>"], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["http://example.com/", "0div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["http://example.com/", "di<v"], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["http://example.com/", "-div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': ["http://example.com/", ".div"], 'err': DomException.INVALID_CHARACTER },
    { 'args': [null, ":div"], 'err': DomException.NAMESPACE },
    { 'args': [null, "div:"], 'err': DomException.NAMESPACE },
    { 'args': ["http://example.com/", ":div"], 'err': DomException.NAMESPACE },
    { 'args': ["http://example.com/", "div:"], 'err': DomException.NAMESPACE },
    { 'args': [null, "d:iv"], 'err': DomException.NAMESPACE },
    { 'args': [null, "a:b:c"], 'err': DomException.NAMESPACE, 'message': "valid XML name, invalid QName" },
    { 'args': ["http://example.com/", "a:b:c"], 'err': DomException.NAMESPACE, 'message': "valid XML name, invalid QName" },
    { 'args': [null, "a::c"], 'err': DomException.NAMESPACE, 'message': "valid XML name, invalid QName" },
    { 'args': ["http://example.com/", "a::c"], 'err': DomException.NAMESPACE, 'message': "valid XML name, invalid QName" },
    { 'args': ["http://example.com/", "a:0"], 'err': DomException.INVALID_CHARACTER, 'message': "valid XML name, not a valid QName" },
    { 'args': ["http://example.com/", "0:a"], 'err': DomException.INVALID_CHARACTER, 'message': "0 at start makes it not a valid XML name" },
    { 'args': ["http://example.com/", "a:_"] },
    { 'args': ["http://example.com/", "a:\u0BC6"], 'err': DomException.NAMESPACE,
      'message': "non-ASCII character after colon is CombiningChar, which is " +
        "NCNameChar but not (Letter | \"_\") so invalid at start of " +
        "NCName (but still a valid XML name, hence not INVALID_CHARACTER_ERR)" },
    { 'args': ["http://example.com/", "\u0BC6:a"], 'err': DomException.INVALID_CHARACTER,
      'message': "non-ASCII character after colon is CombiningChar, which is " +
        "NCNameChar but not (Letter | \"_\") so invalid at start of " +
        "NCName (Gecko chooses to throw NAMESPACE_ERR here, but either is valid " +
        "as this is both an invalid XML name and an invalid QName)" },
    { 'args': ["http://example.com/", "a:a\u0BC6"] },
    { 'args': ["http://example.com/", "a\u0BC6:a"] },
    { 'args': ["http://example.com/", "xml:test"], 'err': DomException.NAMESPACE, 'message': "binding xml prefix wrong" },
    { 'args': ["http://example.com/", "xmlns:test"], 'err': DomException.NAMESPACE, 'message': "binding xmlns prefix wrong" },
    { 'args': ["http://www.w3.org/2000/xmlns/", "x:test"], 'err': DomException.NAMESPACE, 'message': "binding namespace namespace to wrong prefix" },
    { 'args': ["http://www.w3.org/2000/xmlns/", "xmlns:test"] },
    { 'args': ["http://www.w3.org/XML/1998/namespace", "xml:test"] },
    { 'args': ["http://www.w3.org/XML/1998/namespace", "x:test"] },
    { 'args': ["http://www.w3.org/2000/xmlns/", "xmlns"] }, // See http://www.w3.org/2000/xmlns/
    { 'args': ["http://example.com/", "xmlns"], 'err': DomException.NAMESPACE }, // from the createAttributeNS section
  ];

  runTests(tests) {
    for (var t in tests) {
      var element = document.createElement("div");
      var f = element.setAttributeNS;
      var title = 'setAttributeNS';
      var args = t['args'];
      args.add('value');
      title += '(${args.join(", ")})';
      if (t['message'] != null) {
        title += ", " + t['message'];
      }
      if (t['err'] != null) {
        Expect.throws(() {
          Function.apply(f, args);
        }, (e) => e is DomException && e.name == t['err'],
        title);
      } else {
        try {
          Function.apply(f, args);
        } catch (e) {
          Expect.fail(title + e.toString());
        }
      }
    }
  }

  runTests(allNSTests);
}
