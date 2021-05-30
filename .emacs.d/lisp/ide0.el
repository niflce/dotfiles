;; ide0.el IDE stuff

(global-unset-key [S-down-mouse-1])

(defun ide/with-minor () nil)

(add-hook 'hs-minor-mode-hook
	  (lambda ()
	    (when hs-minor-mode
	      (define-key hs-minor-mode-map [S-mouse-2] 'hs-hide-level)
	      (define-key hs-minor-mode-map [S-mouse-1] 'hs-toggle-hiding))))

(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)
(add-hook 'scheme-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-hook 'hs-minor-mode)
(add-hook 'js-mode-hook 'hs-minor-mode)

;; pug-mode
;; (add-hook 'pug-mode-hook
;; 	  (lambda ()
;; 	    (let ((size 2))
;; 	      (setq indent-tabs-mode nil
;; 		    tab-width size
;; 		    pug-tab-width size))))

(provide 'ide0)
;; ide0.el ends
