import 'dart:html';

import 'package:js/js.dart';
import 'package:js_bindings/bindings/webmidi.dart';

@JS()
external void getMidiInputs(Function f);

void main() {
  querySelector('#output')?.text = 'Your Dart app is running.';

  void successForInputs(dynamic inputs) {
    print('DART got array of inputs: $inputs');

    for (var input in (inputs as List<dynamic>)) {
      print('input name in Dart: ${(input as MIDIInput).name}');
    }
  }

  getMidiInputs(allowInterop(successForInputs));
}
