(use-package go-mode
  :ensure t
  :mode
  "\\.go$"
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  )
