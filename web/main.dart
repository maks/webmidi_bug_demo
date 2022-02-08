import 'package:js/js.dart';
import 'package:js/js_util.dart' as jsutil;
import 'package:js_bindings/js_bindings.dart' as html;

void showInputs(dynamic a, dynamic b, dynamic c) {
  print('got args from forEach: |$a| |$b| |$c|');
  final inp = a as html.MIDIInput;
  print('input name: ${inp.name}');
}

void main() async {
  //querySelector('#output')?.text = 'Your Dart app is running.';

  final access = await html.window.navigator
      .requestMIDIAccess(html.MIDIOptions(sysex: true, software: false));

  final inputs = access.inputs;

  jsutil.callMethod(inputs, 'forEach', [allowInterop(showInputs)]);
  inputs.forEach((p0, p1) {
    print('got args from DART forEach: |$p0| |$p1|');
  });
}
