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

\setMusicFolder naptaker.craptaker.kayla

\optionsInit opts
\optionsAdd opts part.guitar.template \Path lalily.instrument.electric-guitar
\optionsAdd opts part.guitar.staff-mods \with {
  % instrumentName = "Guitar"
  midiMaximumVolume = 0.6
  % \remove "Staff_performer"
}
\optionsAdd opts part.bass.template \Path lalily.instrument.bass-guitar
\optionsAdd opts part.drums.template \Path lalily.drums
\optionsAdd opts part.drums.staff-mods \with {
  drumStyleTable = #(alist->hash-table mydrums)
  % instrumentName = "Drums"
}

\setDefaultTemplate naptaker.craptaker.kayla lalily.group #opts

\paper {
  #(set-paper-size "letter" 'landscape)
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

\registerPerson #'sam.albers "Sam Albers" "" % "(1992-)"
\registerPerson #'andrew.smith "Andrew Smith" "" % "(1990-)"
\registerPerson #'naptaker "Naptaker" "" % "(2012-)"

\setTitle "Kayla"
\setComposer #'sam.albers
\setPoet #'andrew.smith
\setArranger #'naptaker

\putMusic meta {
  \key b \major
  \tempo 4 = 170
  \defaultTimeSignature
  \time 4/4
  \repeat unfold 2 {
    s1*8 \break
  }
  s1*9 \break
  \repeat unfold 7 {
    s1*8 \break
  }
  s1*2 |
  \cadenzaOn
  s\breve
  \bar "|."
}

\putMusic guitar \relative c {
  \include "Notes/kayla-guitar_intro.ily"
  \include "../Notes/kayla-guitar_verse.ily"
  \repeat volta 2 {
    \include "../Notes/kayla-guitar_chorus.ily"
  }
  \alternative {
    { \include "../Notes/kayla-guitar_chorus_ending.ily" }
    { \include "../Notes/kayla-guitar_chorus_ending.ily" }
  }
  \include "../Notes/kayla-guitar_bridge.ily"
  \include "../Notes/kayla-guitar_verse.ily"
  \include "../Notes/kayla-guitar_solo.ily"
  \include "../Notes/kayla-guitar_ending.ily"
}

\putMusic bass \relative c {
  \set Staff.midiInstrument = #"electric bass (finger)"
  \include "../Notes/kayla-bass_intro.ily"
  \include "../Notes/kayla-bass_verse.ily"
  \repeat volta 2 {
    \include "../Notes/kayla-bass_chorus.ily"
  }
  \alternative {
    { \include "../Notes/kayla-bass_chorus_ending.ily" }
    { \relative c, { \include "../Notes/kayla-bass_chorus_ending.ily" } }
  }
  \include "../Notes/kayla-bass_bridge.ily"
  \include "../Notes/kayla-bass_verse.ily"
  \repeat unfold 2 {
    \include "../Notes/kayla-bass_chorus.ily"
    \include "../Notes/kayla-bass_chorus_ending.ily"
  }
  \include "../Notes/kayla-bass_bridge.ily"
  \include "../Notes/kayla-bass_ending.ily"
}

\putMusic drums.up \drummode {
  \override Rest #'staff-position = #0
  \override MultiMeasureRest #'Y-offset = #1
  \voiceOne
  \stemUp
  \include "../Notes/kayla-drums-up_intro.ily"
}

\putMusic drums.down \drummode {
  \voiceTwo
  \include "../Notes/kayla-drums-down_intro.ily"
}

\lalilyCreate
