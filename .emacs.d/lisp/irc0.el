;; irc0.el IRC stuff

(setq erc-nick "niflce"
      erc-user-full-name "nifl ce")
(setq erc-server "irc.libera.chat"
      erc-port "6697")
(setq erc-hide-list '("JOIN" "PART" "QUIT" "MODE" "NICK" "KICK" "TOPIC"))
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "MODE" "NICK" "KICK" "333" "353"))

(setq erc-autojoin-channels-alist
      '(("libera.chat" "#libera" "##chat" "#linux" "#archlinux" "#emacs")
        ("oftc.net" "#oftc")))

(with-eval-after-load 'erc
  ;; erc hack for gnutls for client cert.
  (defvar *uconf/erc-certs* nil
    "erc client certs used by gnutls package for :keylist.")
  
  ;; copied from the gnutls lib but set :keylist to client certs.
  ;; this function is called from `open-network-stream' with :type tls.
  (defun uconf/open-gnutls-stream (name buffer host service &optional nowait)
    (let ((process (open-network-stream
                    name buffer host service
                    :nowait nowait
                    :tls-parameters
                    (and nowait
                         (cons 'gnutls-x509pki
                               (gnutls-boot-parameters
                                :type 'gnutls-x509pki
                                :keylist *uconf/erc-certs* ;;added parameter to pass the cert.
                                :hostname (puny-encode-domain host)))))))
      (if nowait
          process
        (gnutls-negotiate :process process
                          :type 'gnutls-x509pki
                          :keylist *uconf/erc-certs* ;;added parameter to pass the cert.
                          :hostname (puny-encode-domain host)))))
  
  ;; only set the global variable when used from `erc-tls'.
  (defun uconf/erc-open-tls-stream (name buffer host port)
    (unwind-protect
        (progn
          (setq *uconf/erc-certs*
                '(("/home/e/.config/erc/certs/nick.key"
                   "/home/e/.config/erc/certs/nick.pem")))
          (open-network-stream name buffer host port
                               :nowait t
                               :type 'tls))
      (setq *uconf/erc-certs* nil)))
  
  (advice-add 'open-gnutls-stream :override #'uconf/open-gnutls-stream)
  (advice-add 'erc-open-tls-stream :override #'uconf/erc-open-tls-stream))

(defun erc-connect ()
  (interactive)
  (erc-tls :server erc-server :port erc-port
           :nick erc-nick :full-name erc-user-full-name))

;; Or assign it to a keybinding
;; This example is also using erc's TLS capabilities:
;; (global-set-key "\C-cen"
;;   (lambda ()
;;   (interactive)
;;   (erc-tls :server "server2.example.com"
;;            :port   "6697")))

(provide 'irc0)
;; irc0.el ends
