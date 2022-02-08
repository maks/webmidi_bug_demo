import 'dart:html';

import 'package:js/js.dart';
import 'package:js_bindings/bindings/webmidi.dart';

@JS()
external void getMidiInputs(Function f);

@JS()
external void getMidiMaplike(Function f);

void main() {
  querySelector('#output')?.text = 'Your Dart app is running.';

  // below shows that receiving a normal JS array of MIDIInput objects
  // works fine in Dart
  void successForInputs(dynamic inputs) {
    print('DART got array of inputs: $inputs');

    for (var input in (inputs as List<dynamic>)) {
      print('input name in Dart: ${(input as MIDIInput).name}');
    }
  }

  getMidiInputs(allowInterop(successForInputs));

  // UNCOMMENT code below to see BUGGY behaviour of JS "maplikes"
  // when they come across into Dart

  // void successForMapLike(dynamic inputs) {
  //   print('DART got map of inputs: $inputs');

  //   for (var input in (inputs as MidiInputMap).keys) {
  //     print('input in Dart: $input');
  //   }
  // }
  // getMidiMaplike(allowInterop(successForMapLike));
}
