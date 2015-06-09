\ottava #-1
\compoundMeter #'((7 8) (9 8))
\set Timing.beatStructure = #'(2 2 3 4 2 3)
\repeat volta 2 {
  a4 a'8 a, e' ees d a c cis d c4 a8 g e |
}
\alternative {
  { a4 a'8 a, e' ees d a c d a gis4 \times 2/3 { e16 f fis } g8 c | }
  {
    \overrideTimeSignatureSettings
    4/4        % timeSignatureFraction
    1/8        % baseMomentFraction
    #'(2 2 2 2)    % beatStructure
    #'()       % beamExceptions
    \time 4/4
    a8 a c c b b bes bes
  }
}

\partial 4
a8 \ottava #0 r
\once \override Staff.BarLine.bar-extent = #'(-2 . 2) \bar "||"
\stopStaff
\override Staff.StaffSymbol #'line-count = #1
\set Staff.middleCPosition = #8
\startStaff \unHideNotes
\improvisationOn
\stemUp
\partial 4*3
r4 bes8 r8 r4 |
\improvisationOff
\stopStaff
\stemNeutral
\set Staff.middleCPosition = #1
\revert Staff.StaffSymbol #'line-count
\startStaff