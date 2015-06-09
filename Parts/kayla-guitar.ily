\include "../Common/version.ily"
\include "../Common/preamble.ily"
\include "../Headers/kayla.ily"
\include "../Globals/kayla.ily"
\include "../Notes/kayla-guitar.ily"

guitarIntro = \relative c {
  \fuzzOn
  \repeat volta 2 {
    <b fis' b dis>2. <dis ais' dis fisis>4 |
    <gis, dis' gis bis>2. <fis cis' fis ais>4 |
  }
  \alternative {
    { <b fis' b dis>2. <dis ais' dis fisis>4 |
      <e b' e gis>4 q8 q <e b' e g> <e b' e gis> <e b' e g>4 | }
    { \fuzzOff
      r4 g8 g:16 g g a g |
      fis4 r8 fis:16 dis fis dis cis^\coda | }
  }
}

guitarChorus = \relative c {
  \fuzzOff
  \arpeggioArrowUp
  \repeat volta 4 {
    b4 \xOn <b fis' b>8 \xOff <b fis' b dis fis b>4\arpeggio cis''8 b \xOn <g, b> \xOff
    gis,4 \xOn <gis dis' gis>8 \xOff <gis dis' gis b dis gis>4\arpeggio ais''8 gis \xOn <g, b> \xOff |
    fis,4 \xOn <fis cis' fis>8 \xOff <fis cis' fis ais cis fis>4\arpeggio gis''8 fis \xOn <g, b> \xOff |
  }
  \alternative {
    { \palmMuteOn f,8 f \palmMuteOff <f c' f a> \palmMuteOn f \palmMuteOff b cis d dis | }
    { \fuzzOn <f, c' f a>1-\markup { "D.C. al Coda" } \bar "||" }
  }
}

guitarEnding = \relative c {
  \repeat volta 2 {
    \fuzzOff
    <gis dis' gis bis>4 \xOn q8 \xOff q4 \xOn q8 \xOff q( <g d' g b> |
    <fis cis' fis ais>4) \xOn q8 \xOff q4 \xOn q8 \xOff q( <g d' g b> |
    <gis dis' gis bis>4) \xOn q8 \xOff q4 \xOn q8 \xOff <b fis' b dis>4 |
    r8 <fis' cis' fis ais>:16 q q q <fis cis' fis c'> <fis cis' fis ais>4 |
    <gis, dis' gis bis>4 \xOn q8 \xOff q4 \xOn q8 \xOff <b fis' b dis>4 |
    <fis cis' fis ais>4) \xOn q8 \xOff q4 \xOn q8 \xOff <e cis' fis ais>( <fis cis' fis ais>) |
  }
  \alternative {
    { \fuzzOn
      <e' b' e gis b e>8 q q <e b' e ais b e>4 <e b' d gis d' e>8 q q ~ |
      q8 q q q4 q8 q4 | }
    { \fuzzOn
      <e b' d gis d' e>8 q q q4 q8 q q8 ~ |
      q8 q q q4 q8 q q |
      <e b' e g b e>8 q q q4 q8 q q8 ~ |
      q8 q q q4 q8 q q |
      \fuzzOff
      <b fis' b dis fis b>\breve }
  }
}

% partNotes = \relative c {
%   \clef "treble_8" \Key
%   \guitarIntro
%   \include "../Notes/kayla-guitar_verse.ily"
%   \guitarChorus \break
%   \once \override Score.RehearsalMark #'extra-offset = #'( -7.5 . 2 )
%   \once \override Score.RehearsalMark #'font-size = #5
%   \mark \markup { \musicglyph #"scripts.coda" }
%   \include "../Notes/kayla-guitar_solo.ily"
%   \guitarEnding
% }
partNotes = { \clef "treble_8" \Key \guitarNotes }
midiNotes = \guitarNotes
