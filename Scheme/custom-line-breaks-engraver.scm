;; Stightly tweaked from David Nalesnik's work.
;; http://lists.gnu.org/archive/html/lilypond-user/2012-05/msg00381.html

(define (custom-line-breaks-engraver bar-list)
  (let* ((working-copy bar-list)
	 (total (1+ (car working-copy))))
    (lambda (context)
      (make-engraver
       (acknowledgers ((paper-column-interface engraver grob source-engraver)
		       (let ((internal-bar (ly:context-property context 'internalBarNumber)))
			 (if (and (pair? working-copy)
				  (zero? (remainder internal-bar total))
				  (eq? #t (ly:grob-property grob 'non-musical)))
			     (begin
			       (set! (ly:grob-property grob 'line-break-permission) 'force)
			       (if (null? (cdr working-copy))
				   (set! working-copy bar-list)
				   (set! working-copy (cdr working-copy)))
			       (set! total (+ total (car working-copy))))))))))))
