;; region0.el Region stuff

(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; paragraph, page
(defun er/add-text-mode-expansions ()
  (make-variable-buffer-local 'er/try-expand-list)
  (setq er/try-expand-list (append
                            er/try-expand-list
                            '(mark-paragraph
                              mark-page))))

(add-hook 'text-mode-hook 'er/add-text-mode-expansions)

;; (defun move-region (start end n)
;;   "Move the current region up or down by N lines."
;;   (interactive "r\np")
;;   (let ((line-text (delete-and-extract-region start end)))
;;     (forward-line n)
;;     (let ((start (point)))
;;       (insert line-text)
;;       (setq deactivate-mark nil)
;;       (set-mark start))))

;; (defun move-region-up (start end n)
;;   "Move the current line up by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) -1 (- n))))

;; (defun move-region-down (start end n)
;;   "Move the current line down by N lines."
;;   (interactive "r\np")
;;   (move-region start end (if (null n) 1 n)))

;; (global-set-key (kbd "M-<up>") 'move-region-up)
;; (global-set-key (kbd "M-<down>") 'move-region-down)

(provide 'region0)
;; region0.el ends
