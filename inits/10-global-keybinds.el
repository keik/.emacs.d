;; when region not active, `kill-region` delete ward backward
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (called-interactively-p) (not (region-active-p)))
    (backward-kill-word 1)
    ad-do-it))

(global-set-key (kbd "C-c a") 'org-agenda)
