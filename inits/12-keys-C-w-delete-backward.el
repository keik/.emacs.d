;; when region not active, C-w do `backward-kill-word` instead of `kill-region`
(defadvice kill-region (around kill-word-or-kill-region activate)
  (if (and (called-interactively-p) (not (region-active-p)))
    (backward-kill-word 1)
    ad-do-it))
