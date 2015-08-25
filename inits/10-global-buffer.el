;; buffer switching
(ido-mode t)
;; disable ido-find-file
(delete '(find-file . ido-find-file)
  (cdr (cdaddr ido-minor-mode-map-entry)))

;; bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; keep *scratch* buffer
(add-hook 'after-save-hook
  (function
    (lambda ()
      (unless
        (member "*scratch*" (mapcar (function buffer-name) (buffer-list)))
        (my-make-scratch 1)))))
(add-hook 'kill-buffer-query-functions
  (function
    (lambda ()
      (if (string= "*scratch*" (buffer-name))
        (progn (my-make-scratch 0) nil)
        t))))
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg
      (progn (setq arg 0)
        (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
      ((= arg 1) (message "another *scratch* is created")))))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; auto-revert
(global-auto-revert-mode 1)
(setq auto-revert-check-vc-info t)
