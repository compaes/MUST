''' Convert MIDI/MusicXML into nmat-like structure from miditoolbox

From: mdlMStrToNMat

    %   Onset (beats) (calc'ed solely from ticks-per-quarter-note)
    %   Duration beats
    %   Channel
    %   MIDI pitch
    %   mIdI velocity
    %   Onset (sec)
    %   Duration (sec)

This expects you have converted MIDI into MusicXML, e.g. via:

    ls -1 Natmust_MusicXML_CSV+MIDI/*mxl | while read fn; do 
        (/Applications/MuseScore\ 3.app/Contents/MacOS/mscore $fn
            -o test.mid >> mscore_conversion_log.txt 2>&1   ); done


Tom Kaplan
'''
import argparse
import glob
import music21
import os
import pandas as pd

COLS = [
    'Key',
    'Onset(beats)',
    'Duration(beats)',
    'Channel',
    'MIDIpitch',
    'MIDIvelocity',
    'Onset(secs)',
    'Duration(secs)',
]

def main(args):
    if not os.path.isdir(args.natmustdir):
        print('Invalid MUST directory: {}'.format(args.natmustdir))
        return

    must_glob = args.natmustdir + os.path.sep + '*.mxl'
    for xml_file in glob.glob(must_glob):

        score = music21.converter.parse(xml_file)
        parts = score.parts
        assert len(parts) == 1, "Expecting single part? ({})".format(xml_file)

        i_m = music21.stream.iterator.RecursiveIterator(parts[0], streamsOnly=True)
        measures = [m for m in i_m]

        recs = []
        elapsed = 0.0
        tie_start = False
        tie_dur = 0.0
        tie_offset = 0.0
        tie_sec = 0.0
        tie_offset_sec = 0.0
        for measure in i_m:
            for n in measure:
                is_note = False
                is_rest = False
                try:
                    is_note = n.isNote
                    is_rest = n.isRest
                except AttributeError:
                    pass
                else:
                    assert not (is_note and is_rest), 'Rest and note?!'
                    if is_note:
                        if n.tie is not None:
                            if not tie_start and n.tie.type == 'start':
                                tie_start = True
                                tie_offset = measure.offset+n.offset
                                tie_offset_sec = elapsed
                                tie_dur = n.quarterLength
                                tie_sec = n.seconds
                            elif tie_start and n.tie.type == 'stop':
                                recs.append([
                                    1,
                                    tie_offset,
                                    tie_dur+n.quarterLength,
                                    0, # Fixed channel?
                                    n.pitch.midi,
                                    n.volume.getRealized(),
                                    tie_offset_sec,
                                    tie_sec+n.seconds,
                                ])
                                tie_offset = 0
                                tie_offset_sec = 0
                                tie_dur = 0
                                tie_sec = 0
                                tie_start = False
                            elif tie_start:
                                tie_dur += n.quarterLength
                                tie_sec += n.seconds
                            elapsed += n.seconds
                        else:
                            vol = n.volume.getRealized()
                            recs.append([
                                1,
                                measure.offset+n.offset,
                                n.quarterLength,
                                0, # Fixed channel?
                                n.pitch.midi,
                                n.volume.getRealized(),
                                elapsed,
                                n.seconds,
                            ])
                            elapsed += n.seconds
                    elif is_rest:
                        recs.append([
                            0,
                            measure.offset+n.offset,
                            n.quarterLength,
                            0, # Fixed channel?
                            0,
                            0,
                            elapsed,
                            n.seconds,
                        ])
                        elapsed += n.seconds

        # Explicitly cast note durations to floats
        for i in range(len(recs)):
            recs[i][2] = float(recs[i][2])

        mel_df = pd.DataFrame(recs, columns=COLS)
        #print(mel_df)
        #print(mel_df.to_csv(None, index=False, sep=' ', float_format='%g'))

        nmat_path = xml_file.replace('.mxl', '.csv')
        mel_df.to_csv(nmat_path, index=False, sep=' ', float_format='%g')
        print('Written {}'.format(nmat_path))

        midi_path = xml_file.replace('.mxl', '.mid')
        score.write('midi', fp=midi_path)
        print('Written {}'.format(midi_path))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('natmustdir', type=str)
    args = parser.parse_args()
    main(args)
