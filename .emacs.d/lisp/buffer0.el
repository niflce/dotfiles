;; buffer0.el Buffer stuff

(require 'key-chord)

(defun buf/scratch ()
  (get-buffer "*scratch*"))

(defun buf/messages ()
  (get-buffer "*Messages*"))

(defun unquit-buffer ()
  (let ((this (current-buffer)))
    (if (or (eq this (buf/scratch))
            (eq this (buf/messages)))
        (progn (bury-buffer) nil)
      t)))

(add-hook 'kill-buffer-query-functions 'unquit-buffer)

(global-set-key (kbd "C-,") 'buffer-menu)
(global-set-key (kbd "C-;") 'kill-buffer)

(key-chord-define-global ".a" 'previous-buffer)
(key-chord-define-global ".d" 'next-buffer)

;; goto
(key-chord-define-global ",g" 'goto-line)

(provide 'buffer0)
;; buffer0.el ends
