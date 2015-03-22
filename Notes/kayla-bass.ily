instrumentName = "Bass"

bassNotes = \relative c {
  \set Staff.midiInstrument = #"electric bass (finger)"
  \include "../Notes/kayla-bass_intro.ily"
  \include "../Notes/kayla-bass_verse.ily"
  \repeat volta 2 {
    \include "../Notes/kayla-bass_chorus.ily"
  }
  \include "../Notes/kayla-bass_bridge.ily"
  \include "../Notes/kayla-bass_verse.ily"
  \repeat unfold 2 {
    \include "../Notes/kayla-bass_chorus.ily"
  }
  \include "../Notes/kayla-bass_bridge.ily"
  \include "../Notes/kayla-bass_ending.ily"
}
