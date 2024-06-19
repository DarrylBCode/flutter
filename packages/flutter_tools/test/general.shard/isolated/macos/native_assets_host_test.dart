// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_tools/src/isolated/native_assets/macos/native_assets_host.dart';

import '../../../src/common.dart';

void main() {
  test('framework name', () {
    expect(
      frameworkUri('libfoo.dylib', <String>{}),
      equals(Uri.file('foo.framework/foo')),
    );
    expect(
      frameworkUri('foo', <String>{}),
      equals(Uri.file('foo.framework/foo')),
    );
    expect(
      frameworkUri('foo_foo', <String>{}),
      equals(Uri.file('foo_foo.framework/foo_foo')),
    );
    expect(
      frameworkUri('foo-foo', <String>{}),
      equals(Uri.file('foo-foo.framework/foo-foo')),
    );
    expect(
      frameworkUri(r'foo$foo', <String>{}),
      equals(Uri.file('foofoo.framework/foofoo')),
    );
    expect(
      frameworkUri('foo.foo', <String>{}),
      equals(Uri.file('foofoo.framework/foofoo')),
    );
    expect(
      frameworkUri('libatoolongfilenameforaframework.dylib', <String>{}),
      equals(Uri.file('atoolongfilenameforaframework.framework/atoolongfilenameforaframework')),
    );
  });

  test('framework name conflicts', () {
    final Set<String> alreadyTakenNames = <String>{};
    expect(
      frameworkUri('libfoo.dylib', alreadyTakenNames),
      equals(Uri.file('foo.framework/foo')),
    );
    expect(
      frameworkUri('libfoo.dylib', alreadyTakenNames),
      equals(Uri.file('foo1.framework/foo1')),
    );
    expect(
      frameworkUri('libfoo.dylib', alreadyTakenNames),
      equals(Uri.file('foo2.framework/foo2')),
    );
    expect(
      frameworkUri('libatoolongfilenameforaframework.dylib', alreadyTakenNames),
      equals(Uri.file('atoolongfilenameforaframework.framework/atoolongfilenameforaframework')),
    );
    expect(
      frameworkUri('libatoolongfilenameforaframework.dylib', alreadyTakenNames),
      equals(Uri.file('atoolongfilenameforaframework1.framework/atoolongfilenameforaframework1')),
    );
    expect(
      frameworkUri('libatoolongfilenameforaframework.dylib', alreadyTakenNames),
      equals(Uri.file('atoolongfilenameforaframework2.framework/atoolongfilenameforaframework2')),
    );
  });
}
