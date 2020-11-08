(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(global-set-key (kbd "C-t") 'other-window-or-split)

;; terminal で使えないのでやめておく
;; (global-set-key (kbd "C-<tab>") 'other-window)
;; (global-set-key (kbd "<C-S-iso-lefttab>")
;;   (lambda () (interactive) (other-window -1)))
;; (global-set-key (kbd "<C-S-tab>")
;;   (lambda () (interactive) (other-window -1)))
