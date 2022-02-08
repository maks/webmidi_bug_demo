var getMidiMaplike =
  function (callback) {
    console.log('getMidi returning');
    navigator.requestMIDIAccess({ sysex: true }).then((midiAccess) => {
      console.log('access', midiAccess);
      let inputs = [];
      midiAccess.inputs.forEach((input, name) => {
        console.log(`input name: ${name} input:${input.name}`);
        inputs.push(input);
      });

      callback(midiAccess.inputs)
    });
  }

var getMidiInputs =
  function (callback) {
    console.log('getMidi returning');
    navigator.requestMIDIAccess({ sysex: true }).then((midiAccess) => {
      console.log('access', midiAccess);
      let inputs = [];
      midiAccess.inputs.forEach((input, name) => {
        console.log(`input name: ${name} input:${input.name}`);
        inputs.push(input);
      });

      callback(inputs)
    });
  }  
