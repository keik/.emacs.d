;; backup
(setq make-backup-files t
  backup-directory-alist '(("." . "~/.saves")))

(setq auto-save-default nil)
(setq create-lockfiles nil)

;; session
(when (require 'session nil 'noerror)
  (setq session-initialize '(de-saveplace session keys menus places)
    session-globals-include '((kill-ring 50)
                               (session-file-alist 500 t)
                               (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  (setq history-length t))

;; keep cursor position in closed buffer
(setq session-undo-check -1)
