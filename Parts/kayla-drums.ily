\include "../Common/version.ily"
\include "../Common/preamble.ily"
\include "../Headers/kayla.ily"
\include "../Globals/kayla.ily"
\include "../Notes/kayla-drums.ily"

partNotes = {
  <<
    \new DrumVoice \drumsUpNotes
    \new DrumVoice \drumsDownNotes
  >>
}
midiNotes = \partNotes
