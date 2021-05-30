;; window0.el Window stuff

(require 'key-chord)

(global-set-key (kbd "C-'") 'delete-window)

(key-chord-define-global ",d" 'other-window)
(key-chord-define-global "/d" 'split-window-right)
(key-chord-define-global "/s" 'split-window-below)

(provide 'window0)
;; window0.el ends
