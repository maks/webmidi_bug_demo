import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart' as jsutil;
import 'package:js_bindings/js_bindings.dart' as html;

@JS()
external void getMidiInputs(Function f);

@JS()
external void getMidiMaplike(Function f);

void showInputs(dynamic a, dynamic b, dynamic c) {
  print('got args from forEach: [$a] [$b] [$c]');
  final inp = a as MidiInput;
  print('input name: ${inp.name}');
}

void main() async {
  querySelector('#output')?.text = 'Your Dart app is running.';

  final access = await html.window.navigator
      .requestMIDIAccess(html.MIDIOptions(sysex: true, software: false));

  final inputs = access.inputs;

  jsutil.callMethod(inputs, 'forEach', [allowInterop(showInputs)]);
}
