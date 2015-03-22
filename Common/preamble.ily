\include "articulate.ly"

fuzzOn = \set midiInstrument = #"overdriven guitar"
fuzzOff = \set midiInstrument = #"electric guitar (clean)"

xOn  = \deadNotesOn
xOff = \deadNotesOff

#(set-global-staff-size 11)
#(set-default-paper-size "letter" 'portrait)

#(set! %load-path `("Scheme" ,@%load-path))
#(load-from-path "custom-line-breaks-engraver.scm")
