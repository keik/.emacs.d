;; when region not active, C-w do `backward-kill-word` instead of `kill-region`
;; (defadvice kill-region (around kill-word-or-kill-region activate)
;;   (if (and (called-interactively-p "interactive") (not (region-active-p)))
;;     (backward-kill-word 1)
;;     ad-do-it))

;; (global-set-key (kbd "C-w") 'backward-kill-word)

;; https://stackoverflow.com/a/6133921
;; (defun backward-delete-word (arg)
;;   "Delete characters backward until encountering the beginning of a word.
;; With argument ARG, do this that many times."
;;   (interactive "p")
;;   (delete-region (point) (progn (backward-word arg) (point))))
;; (global-set-key (kbd "M-DEL") 'backward-delete-word)

