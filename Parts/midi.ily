\include "../Common/version.ily"

\score {
  <<
    \unfoldRepeats \articulate
    \new Staff {
      << \global \midiNotes >>
    }
  >>
  \midi {}
}
