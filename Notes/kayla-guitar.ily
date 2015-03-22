instrumentName = "Guitar"

guitarNotes = \relative c {
  \set Staff.midiInstrument = #"distorted guitar"
  \include "../Notes/kayla-guitar_intro.ily"
  \include "../Notes/kayla-guitar_verse.ily"
  \repeat volta 2 {
    \include "../Notes/kayla-guitar_chorus.ily"
  }
  \include "../Notes/kayla-guitar_bridge.ily"
  \include "../Notes/kayla-guitar_verse.ily"
  \include "../Notes/kayla-guitar_solo.ily"
  \include "../Notes/kayla-guitar_ending.ily"
}
