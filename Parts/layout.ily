\include "defaults.ily"

\score {
  \new Staff {
    \partDefaults
    << \global \partNotes >>
  }
  \layout {
    \context {
      \Score
      % \override NonMusicalPaperColumn #'line-break-permission = ##f
      \consists #(custom-line-breaks-engraver '(4))
    }
  }
}
