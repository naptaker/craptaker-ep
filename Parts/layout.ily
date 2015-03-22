\include "defaults.ily"

\score {
  \new Staff {
    \partDefaults
    << \global \partNotes >>
  }
  \layout {
    indent = 0\in
    \context {
      \Score
      % \override NonMusicalPaperColumn #'line-break-permission = ##f
      \consists #(custom-line-breaks-engraver '(4))
    }
  }
}
