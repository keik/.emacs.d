(use-package go-mode
  :ensure t
  :mode "\\.go$"

  :bind (:map go-mode-map
              ("C-c C-t" . go-test-current-test)
              ("C-c C-s-t" . go-test-current-file)
              ;; lsp-mode によって不要かも
              ;; ("M-." . godef-jump))
              )
  )

(use-package gotest
  :ensure t
  )
