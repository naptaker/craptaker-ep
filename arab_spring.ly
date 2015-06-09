\version "2.18.2"
\include "lalily.ly"
% \include "articulate.ly"

#(set-global-staff-size 11)

#(set-registry-val '(lalily person arranger pre) "Arranged by")
#(set-registry-val '(lalily person composer pre) "Music by")
#(set-registry-val '(lalily person poet pre) "Words by")
#(set-registry-val '(lalily header copyright) #{ \markup { \with-url #"http://naptakerrr.com" "Naptaker" } #})

#(define mydrums '((bassdrum      default #f -3)
                   (snare         default #f  1)
                   (closedhihat   cross   #f  5)
                   (halfopenhihat xcircle #f  5)
                   (lowtom        default #f -1)
                   (pedalhihat    cross   #f -5)
                   (crashcymbal   cross   #f  6)
                   (ridecymbal    cross   #f  4)))

\setMusicFolder naptaker.craptaker.arab_spring

\optionsInit opts
\optionsAdd opts part.guitar.template \Path lalily.instrument.electric-guitar
\optionsAdd opts part.guitar.staff-mods \with {
  % instrumentName = "Guitar"
  midiMaximumVolume = 0.6
  % \remove "Staff_performer"
  \RemoveEmptyStaves
  \override VerticalAxisGroup #'remove-first = ##t
}

\optionsAdd opts part.guitar-strum.template \Path lalily.instrument.electric-guitar
\optionsAdd opts part.guitar-strum.staff-context "RhythmicStaff"
\optionsAdd opts part.guitar-strum.staff-mods \with {
  % instrumentName = "Guitar"
  midiMaximumVolume = 0.6
  % \remove "Staff_performer"
  \RemoveEmptyStaves
  \override VerticalAxisGroup #'remove-first = ##t
}

% \optionsAdd opts part.bass.template \Path lalily.instrument.bass-guitar
% \optionsAdd opts part.drums.template \Path lalily.drums
% \optionsAdd opts part.drums.staff-mods \with {
%   drumStyleTable = #(alist->hash-table mydrums)
%   % instrumentName = "Drums"
% }

\setDefaultTemplate naptaker.craptaker.arab_spring lalily.group #opts

\paper {
  % #(set-paper-size "letter" 'landscape)
  #(set-paper-size "letter" 'portrait)
  indent = 0.0\in
  ragged-last = ##t
  % #(define fonts
  %   (set-global-fonts
  %     #:music "lilyjazz"
  %     #:brace "lilyjazz"
  %     #:roman "LilyJAZZText"
  %     #:sans "LilyJAZZChord"
  %     #:factor (/ staff-height pt 20)))
}

fuzzOn = \set midiInstrument = #"overdriven guitar"
fuzzOff = \set midiInstrument = #"electric guitar (clean)"

xOn  = \deadNotesOn
xOff = \deadNotesOff

\registerPerson #'eric.bailey "Eric Bailey" "" % "(1989-)"
\registerPerson #'andrew.smith "Andrew Smith" "" % "(1990-)"
\registerPerson #'naptaker "Naptaker" "" % "(2012-)"

\setTitle "Arab Spring"
\setComposer #'eric.bailey
\setPoet #'andrew.smith
\setArranger #'naptaker

\putMusic meta {
  \key a \minor
  \tempo 4 = 196
  \defaultTimeSignature
  \time 2/4
  s2*6 s2*2 \time 4/4 s1 \break
  \time 2/4
  s2*8 \break
  s2*6 \time 4/4 s1 \break
  s2*8 \break
  s2*2 \time 4/4 s1*5 \break
  s1*4 \break
  s1*6 \break
  s1*8 \break
  s1*8 \break
  s1*4 \break
  s1*4 \break
  % \bar "|."
}

\putMusic guitar \relative c {
  \include "Notes/arab_spring-guitar_intro.ily"
  s2*8
  \repeat volta 2 {
    s2*8
    s2*8
  }
  s2*2
  s1*5
  \include "Notes/arab_spring-guitar_verse-main.ily" c,4 |
  \include "Notes/arab_spring-guitar_verse-b.ily"
  s1*8
  s1*7
  s1 % r8 e\< e e e e e e\! |
  \include "Notes/arab_spring-guitar_verse-main.ily" c4 |
  \key cis \major
  \set Staff.explicitKeySignatureVisibility = #end-of-line-invisible
  \include "Notes/arab_spring-guitar_bridge-b.ily"
  \key a \minor
  \include "Notes/arab_spring-guitar_verse-d.ily"
  \relative c {  \include "Notes/arab_spring-guitar_verse-main.ily" c4 } |
}

\putMusic guitar-strum \relative c {
  \set Staff.midiInstrument = #"electric guitar (distorted)"
  R1*5  |
  \improvisationOn
  \tieDown
  \include "Notes/arab_spring-guitar_chorus-a.ily"
  \repeat volta 2 {
    \include "Notes/arab_spring-guitar_chorus-b.ily"
    \include "Notes/arab_spring-guitar_chorus-a.ily"
  }
  \include "Notes/arab_spring-guitar_bridge-a.ily"
  R1*4 |
  R1*4 |
  R1*6 |
  \include "Notes/arab_spring-guitar_verse-c.ily"
  a1 ~ | a1 ~ | a1 |
  r2 bes8 r8 r4 |
  a1 ~ | a1 ~ | a1 |
}

\lalilyCreate
