\repeat volta 2 {
  c4 c8 b | c4 b8 c |
  dis8 e e dis | e4 g8 a |
  a,4 a8 gis | a4 g8 a |
}
\alternative {
  { c8 b g b |
    e,4 a8 b | }
  { \set Staff.midiInstrument = #"electric guitar (distorted)"
    \time 4/4
    c4 b e, b' | }
}
