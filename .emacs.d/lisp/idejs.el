;; idejs.el JS stuff

(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

(defun ide/js2-with-minor ()
  (hs-minor-mode)
  (company-mode)
  (require 'flow-minor-mode)
  (flow-minor-enable-automatically))

(defun ide/js2-with-backend ()
  (require 'xref-js2)
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))

(with-eval-after-load 'js2-mode
  (define-key js2-mode-map (kbd "M-.") nil)
  (setq-default
   js2-mode-indent-ignore-first-tab t
   js2-mode-show-parse-errors nil
   js2-mode-show-strict-warnings nil
   js2-missing-semi-one-line-override t
   js2-strict-missing-semi-warning nil)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'ide/js2-with-minor)
  (add-hook 'js2-mode-hook 'ide/js2-with-backend))

(with-eval-after-load 'flycheck
  (require 'flycheck-flow)
  (flycheck-add-mode 'javascript-flow 'flow-minor-mode)
  (flycheck-add-mode 'javascript-eslint 'flow-minor-mode)
  (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))

(with-eval-after-load 'company
  (require 'company-flow)
  (add-to-list 'company-backends 'company-flow))

(provide 'idejs)
;; idejs.el ends
