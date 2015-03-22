\include "defaults.ily"
\include "../Common/preamble.ily"

\header {
  instrument = "Full Score"
}

\score {
  <<
    \new Staff {
      \partDefaults
      << \global \clef "treble_8" \Key \guitarNotes >>
    }
    \new Staff {
      \partDefaults
      << \global \clef "bass" \Key \bassNotes >>
    }
    % \new DrumStaff {
    %   \partDefaults
    %   << \global
    % 	 <<
    % 	   \new DrumVoice \drumUpNotes
    % 	   \new DrumVoice \drumDownNotes
    % 	 >>
    %    >>
    % }
  >>

  \layout {
    indent = 0\in
    \context {
      \Score
      % \override NonMusicalPaperColumn #'line-break-permission = ##f
      \consists #(custom-line-breaks-engraver '(4))
    }
  }
}

\score {
  <<
    \new Staff {
      << \global \unfoldRepeats \articulate \guitarNotes >>
    }
    \new Staff {
      << \global \unfoldRepeats \articulate \transpose c c, \bassNotes >>
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
