(use-package web-mode
  :ensure t
  :mode
   "\\.js$"
   "\\.jsx$"
  :config
  (add-hook 'web-mode-hook #'(lambda () (setq web-mode-enable-auto-indentation nil)))
  ;;(setq web-mode-enable-auto-indentation nil)
  ;;(setq web-mode-attr-indent-offset 2)
  ;;(setq web-mode-markup-indent-offset 2)
  ;;(setq web-mode-css-indent-offset 2)
  ;;(setq web-mode-code-indent-offset 2)
  ;;(setq web-mode-sql-indent-offset 2)
  ;;(setq indent-tabs-mode nil)
  ;;(setq tab-width 2)
  ;;(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  ;;(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  ;;(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  ;;(add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  ;;(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  ;;(add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  )
