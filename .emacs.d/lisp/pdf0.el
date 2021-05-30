;; pdf0.el PDF stuff

;; (use-package pdf-tools
;;   :if my/laptop-p
;;   :config
;;   (pdf-tools-install)
;;   (setq pdf-view-resize-factor 1.1)
;;   (setq-default pdf-view-display-size 'fit-page))

(require 'pdf-tools)

(with-eval-after-load 'pdf-tools
  (pdf-tools-install)
  (setq-default
   pdf-view-display-size'fit-width
   pdf-view-resize-factor 1.1)
  ;;marker
  (add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode))

;; (pdf-view-mark-whole-page) 
;; (pdf-view-kill-ring-save)

(provide 'pdf0)
;; pdf0.el ends
