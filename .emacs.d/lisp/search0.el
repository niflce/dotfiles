;; search0.el Search stuff

(require 'key-chord)

(key-chord-define-global ",o" 'find-file)
(key-chord-define-global ",f" 'find-function)
(key-chord-define-global "?f" 'describe-function)
(key-chord-define-global ",L" 'find-library)
(key-chord-define-global ",v" 'find-variable)
(key-chord-define-global "?v" 'describe-variable)
(key-chord-define-global "?s" 'info-lookup-symbol)
(key-chord-define-global "?k" 'describe-key)

(provide 'search0)
;; search0.el ends
