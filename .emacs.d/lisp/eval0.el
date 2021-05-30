;; eval0.el Evaluation stuff
;; (read-kbd-macro SEQ)

;; resettable `ctrl-meta-x'
(global-set-key [f1] 'eval-last-sexp)
(global-set-key [f2] (lambda () (interactive)
		       (let ((current-prefix-arg '(4)))
			 (call-interactively #'eval-last-sexp))))

(provide 'eval0)
;; eval0.el ends
