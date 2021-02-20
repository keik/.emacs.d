(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  ;;(setq dumb-jump-default-project "")
  (setq dumb-jump-force-searcher 'ag)
)
