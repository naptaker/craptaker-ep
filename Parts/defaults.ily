#(set-global-staff-size 21)
#(set-default-paper-size "letter" 'portrait)

\paper {
  bottom-margin = .5\in
  max-systems-per-page = 8
}

\header {
  instrument = \instrumentName
}

partDefaults = {
  \accidentalStyle "modern"
  \override MultiMeasureRest #'expand-limit = 8
  \compressFullBarRests
  \numericTimeSignature
}
