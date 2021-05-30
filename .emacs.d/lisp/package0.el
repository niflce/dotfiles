;; package.el Package stuff -*- lexical-binding: t -*-

(let ((miniver 24))
  (when (< emacs-major-version miniver)
    (error "As built-in `package', requires emacs %s or higher" miniver)))

(require 'package)

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
	("http" . "127.0.0.1:9910")
	("https" . "127.0.0.1:9910")))

(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(provide 'package0)
;; package0.el ends

