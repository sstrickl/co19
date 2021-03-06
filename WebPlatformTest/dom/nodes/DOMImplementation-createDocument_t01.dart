/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/DOMImplementation-createDocument.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-domimplementation-createdocument">
 *
 * @assertion DOMImplementation.createDocument(namespace, qualifiedName, doctype)
 * @description 
 * @needsreview what is dart's equivalent of Document.doctype?
 * @note dartium crashes with "Aw, Snap!"
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

dynamic tests = [
    /* Arrays with four elements:
     *   the namespace argument
     *   the qualifiedName argument
     *   the doctype argument
     *   the expected exception, or null if none
     */
    [null, null, false, "TypeError"],
    [null, null, null, null],
    [null, "", null, null],
    [null, "foo", null, null],
    [null, "1foo", null, "INVALID_CHARACTER_ERR"],
    [null, "f1oo", null, null],
    [null, "foo1", null, null],
    [null, ":foo", null, "NAMESPACE_ERR"],
    [null, "f:oo", null, "NAMESPACE_ERR"],
    [null, "foo:", null, "NAMESPACE_ERR"],
    [null, "xml", null, null],
    [null, "xmlns", null, "NAMESPACE_ERR"],
    [null, "xmlfoo", null, null],
    [null, "xml:foo", null, "NAMESPACE_ERR"],
    [null, "xmlns:foo", null, "NAMESPACE_ERR"],
    [null, "xmlfoo:bar", null, "NAMESPACE_ERR"],
    ["http://example.com/", null, null, null],
    ["http://example.com/", "", null, null],
    ["http://example.com/", "foo", null, null],
    ["http://example.com/", "1foo", null, "INVALID_CHARACTER_ERR"],
    ["http://example.com/", "f1oo", null, null],
    ["http://example.com/", "foo1", null, null],
    ["http://example.com/", ":foo", null, "NAMESPACE_ERR"],
    ["http://example.com/", "f:oo", null, null],
    ["http://example.com/", "foo:", null, "NAMESPACE_ERR"],
    ["http://example.com/", "xml", null, null],
    ["http://example.com/", "xmlns", null, "NAMESPACE_ERR"],
    ["http://example.com/", "xmlfoo", null, null],
    ["http://example.com/", "xml:foo", null, "NAMESPACE_ERR"],
    ["http://example.com/", "xmlns:foo", null, "NAMESPACE_ERR"],
    ["http://example.com/", "xmlfoo:bar", null, null],
    ["/", null, null, null],
    ["/", "", null, null],
    ["/", "foo", null, null],
    ["/", "1foo", null, "INVALID_CHARACTER_ERR"],
    ["/", "f1oo", null, null],
    ["/", "foo1", null, null],
    ["/", ":foo", null, "NAMESPACE_ERR"],
    ["/", "f:oo", null, null],
    ["/", "foo:", null, "NAMESPACE_ERR"],
    ["/", "xml", null, null],
    ["/", "xmlns", null, "NAMESPACE_ERR"],
    ["/", "xmlfoo", null, null],
    ["/", "xml:foo", null, "NAMESPACE_ERR"],
    ["/", "xmlns:foo", null, "NAMESPACE_ERR"],
    ["/", "xmlfoo:bar", null, null],
    ["http://www.w3.org/XML/1998/namespace", null, null, null],
    ["http://www.w3.org/XML/1998/namespace", "", null, null],
    ["http://www.w3.org/XML/1998/namespace", "foo", null, null],
    ["http://www.w3.org/XML/1998/namespace", "1foo", null, "INVALID_CHARACTER_ERR"],
    ["http://www.w3.org/XML/1998/namespace", "f1oo", null, null],
    ["http://www.w3.org/XML/1998/namespace", "foo1", null, null],
    ["http://www.w3.org/XML/1998/namespace", ":foo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/XML/1998/namespace", "f:oo", null, null],
    ["http://www.w3.org/XML/1998/namespace", "foo:", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/XML/1998/namespace", "xml", null, null],
    ["http://www.w3.org/XML/1998/namespace", "xmlns", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/XML/1998/namespace", "xmlfoo", null, null],
    ["http://www.w3.org/XML/1998/namespace", "xml:foo", null, null],
    ["http://www.w3.org/XML/1998/namespace", "xmlns:foo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/XML/1998/namespace", "xmlfoo:bar", null, null],
    ["http://www.w3.org/2000/xmlns/", null, null, null],
    ["http://www.w3.org/2000/xmlns/", "", null, null],
    ["http://www.w3.org/2000/xmlns/", "foo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "1foo", null, "INVALID_CHARACTER_ERR"],
    ["http://www.w3.org/2000/xmlns/", "f1oo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "foo1", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", ":foo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "f:oo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "foo:", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "xml", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "xmlns", null, null],
    ["http://www.w3.org/2000/xmlns/", "xmlfoo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "xml:foo", null, "NAMESPACE_ERR"],
    ["http://www.w3.org/2000/xmlns/", "xmlns:foo", null, null],
    ["http://www.w3.org/2000/xmlns/", "xmlfoo:bar", null, "NAMESPACE_ERR"],
    ["foo:", null, null, null],
    ["foo:", "", null, null],
    ["foo:", "foo", null, null],
    ["foo:", "1foo", null, "INVALID_CHARACTER_ERR"],
    ["foo:", "f1oo", null, null],
    ["foo:", "foo1", null, null],
    ["foo:", ":foo", null, "NAMESPACE_ERR"],
    ["foo:", "f:oo", null, null],
    ["foo:", "foo:", null, "NAMESPACE_ERR"],
    ["foo:", "xml", null, null],
    ["foo:", "xmlns", null, "NAMESPACE_ERR"],
    ["foo:", "xmlfoo", null, null],
    ["foo:", "xml:foo", null, "NAMESPACE_ERR"],
    ["foo:", "xmlns:foo", null, "NAMESPACE_ERR"],
    ["foo:", "xmlfoo:bar", null, null],
    [null, null, document.implementation.createDocumentType("foo", "", ""), null],
//    [null, null, document.doctype, null], // This causes a horrible WebKit bug (now fixed in trunk).
    
    [null, null, () {
        var foo = document.implementation.createDocumentType("foo", "", "");
        document.implementation.createDocument(null, null, foo);
        return foo;
     }(), null], // DOCTYPE already associated with a document.
     
    [null, null, () {
        var bar = document.implementation.createDocument(null, null, null);
        return bar.implementation.createDocumentType("bar", "", "");
     }(), null], // DOCTYPE created by a different implementation.
     
    [null, null, () {
        var bar = document.implementation.createDocument(null, null, null);
        var magic = bar.implementation.createDocumentType("bar", "", "");
        bar.implementation.createDocument(null, null, magic);
        return magic;
     }(), null], // DOCTYPE created by a different implementation and already associated with a document.
     
    [null, "foo", document.implementation.createDocumentType("foo", "", ""), null],
    ["foo", null, document.implementation.createDocumentType("foo", "", ""), null],
    ["foo", "bar", document.implementation.createDocumentType("foo", "", ""), null],
  ];

void main() {
  tests.forEach((t) {
    String namespace = t[0], qualifiedName = t[1], doctype = t[2], expected = t[3];

    print("Now tested");print(namespace);print(qualifiedName);print(expected);

    if (expected != null) {
      assert_throws(expected, () {
        document.implementation.createDocument(namespace, qualifiedName,
            document.implementation.createDocumentType(doctype, "", ""));
       });
    } else {
      var doc = document.implementation.createDocument(namespace, qualifiedName,
          document.implementation.createDocumentType(doctype, "", ""));
      assert_equals(doc.nodeType, Node.DOCUMENT_NODE);
      var omitRootElement = qualifiedName == null || qualifiedName == "";
      if (omitRootElement) {
        assert_equals(doc.documentElement, null);
      } else {
        var element = doc.documentElement;
        assert_not_equals(element, null);
        assert_equals(element.nodeType, Node.ELEMENT_NODE);
        assert_equals(element.ownerDocument, doc);
        String qualified = qualifiedName;
        List<String> names = [];
        if (qualified.indexOf(":") >= 0) {
          names = qualified.split(":");
        } else {
          names = [null, qualified];
        }
        assert_equals(element.getAttribute("prefix"), names[0]);
        assert_equals(element.localName, names[1]);
        assert_equals(element.getAttribute("namespaceURI"), namespace);
      }
      /* -- what is dart's equivalent of Document.doctype?
      if (doctype==null) {
        assert_equals(doc.doctype, null);
      } else {
        assert_equals(doc.doctype, doctype);
        assert_equals(doc.doctype.ownerDocument, doc);
      }

      assert_equals(doc.childNodes.length, !omitRootElement + !!doctype);*/
    }
  });

  checkTestFailures();
}
