;; Common Lisp
(when (require 'slime nil 'noerror)
  (add-hook 'lisp-mode-hook
    (lambda ()
      (slime-mode t)
      (show-paren-mode)))
  (slime-setup '(slime-repl))
  (setq slime-net-coding-system 'utf-8-dos))

;; http://modern-cl.blogspot.jp/
;;(push '("*slime-apropos*") popwin:special-display-config)
;;(push '("*slime-macroexpansion*") popwin:special-display-config)
;;(push '("*slime-description*") popwin:special-display-config)
;;(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;;(push '("*slime-xref*") popwin:special-display-config)
;;(push '(sldb-mode :stick t) popwin:special-display-config)
;;(push '(slime-repl-mode) popwin:special-display-config)
;;(push '(slime-connection-list-mode) popwin:special-display-config)
;;(require 'ac-slime)
;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;(eval-after-load "auto-complete"
;;  '(add-to-list 'ac-modes 'slime-repl-mode))
