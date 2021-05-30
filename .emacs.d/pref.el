;; pref.el Preference

(setq frame-resize-pixelwise t
      initial-frame-alist '((fullscreen . maximized))
      inhibit-startup-screen t)
(setq initial-buffer-choice nil)
(setq-default major-mode 'text-mode)
(setq visible-bell t)
(setq make-backup-files nil)
(setq auto-image-file-mode t)
(setq-default indent-tabs-mode nil
	      js-indent-level 2
	      tab-width 2)
(setq display-time-day-and-date t
      display-time-24hr-format t
      display-time-format "%d %m %Y %H:%M")
(setq user-full-name "nifl ce"
      user-mail-address "niflndce@gmail.com")

(fset 'yes-or-no-p 'y-or-n-p)
(setenv "LC_CTYPE" "zh_CN.utf-8")

(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(default-input-method "chinese-py")
 '(display-battery-mode t)
 '(display-time-mode t)
 '(flycheck-javascript-flow-args nil)
 '(fringe-mode 0 nil (fringe))
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(expand-region company-flow flycheck-flow xref-js2 js2-mode flow-js2-mode emms flow-minor-mode pdf-tools nov use-package flycheck company colorless-themes key-chord))
 '(pdf-view-midnight-colors '("cadet blue" . "#000000"))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :slant normal :weight normal :height 128 :width normal :foundry "UNKN" :family "ProFont for Powerline"))))
 '(fixed-pitch ((t (:inherit default))))
 '(fixed-pitch-serif ((t (:inherit default))))
 '(js2-function-param ((t (:foreground "default"))))
 '(variable-pitch ((t (:inherit default)))))

;; (set-face-attribute 'default nil :font FONT )
;; (set-frame-font FONT nil t)

(provide 'pref)
;; pref.el ends
