;; 複数カーソル操作
(use-package multiple-cursors
  :ensure t
  :bind
  ("C-c C-c C-s" . mc/mark-all-like-this)
  ("C-c C-c C-m" . mc/edit-lines))

;; 慣らし中。不要なら消す
;; (global-set-key (kbd "C-M-c") 'mc/edit-lines)
;; (global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
;; (global-unset-key "\C-t")
;; (smartrep-define-key global-map "C-t"
;;   '(("C-s"      . 'mc/mark-next-like-this)
;;     ("C-r"      . 'mc/mark-previous-like-this)
;;     ("n"        . 'mc/mark-next-lines)
;;     ("p"        . 'mc/mark-previous-lines)
;;     ("m"        . 'mc/mark-more-like-this-extended)
;;     ("u"        . 'mc/unmark-next-like-this)
;;     ("U"        . 'mc/unmark-previous-like-this)
;;     ("s"        . 'mc/skip-to-next-like-this)
;;     ("S"        . 'mc/skip-to-previous-like-this)
;;     ("*"        . 'mc/mark-all-like-this)
;;     ("d"        . 'mc/mark-all-like-this-dwim)
;;     ("i"        . 'mc/insert-numbers)
;;     ("o"        . 'mc/sort-regions)
;;     ("O"        . 'mc/reverse-regions)))
