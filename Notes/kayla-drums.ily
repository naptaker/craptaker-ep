instrumentName = "Drums"

drumsUpNotes = \drummode {
  \override Rest #'staff-position = #0
  \override MultiMeasureRest #'Y-offset = #1
  \voiceOne
  \stemUp
  \include "../Notes/kayla-drums-up_intro.ily"
}

drumsDownNotes = \drummode {
  \voiceTwo
  \include "../Notes/kayla-drums-down_intro.ily"
}
