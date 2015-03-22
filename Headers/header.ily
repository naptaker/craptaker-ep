\include "../Common/version.ily"

licenseNotice = "This work is licensed under a Creative Commons Attribution 4.0 International License."
licenseLink   = "http://creativecommons.org/licenses/by/4.0/"

\header {
  arranger  = \markup { \column { \right-align "Arr. by S. Albers, E. Bailey"
				  \right-align "P. Drum, and A. Smith" } }
  tagline   = ##f
  copyright = \markup { \center-column { \teeny \licenseNotice
					 \teeny \licenseLink
					 \small "© 2015 Naptaker" } }
}

\paper {
  top-margin    = 0.75\in
  right-margin  = 0.5\in
  bottom-margin = 0.75\in
  left-margin   = 0.5\in
}
