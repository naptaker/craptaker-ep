\include "../Common/version.ily"

\score {
  <<
    \unfoldRepeats \articulate
    \new Staff {
      << \global \midiNotes >>
    }
  >>
  \midi {
    \context {
      \Staff
      \remove "Staff_performer"
    }
    \context {
      \Voice
      \consists "Staff_performer"
    }
  } 
}
