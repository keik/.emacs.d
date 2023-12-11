;;; 19-prg-lsp.el --- settings for Language Server Protocol
;;; Commentary:
;;; Code:
(defvar flycheck-checker)
(defvar flycheck-checkers)
(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-l")
  (setq read-process-output-max (* 1024 1024))
  (setq gc-cons-threshold 100000000)
  (setq lsp-idle-delay 1.000)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-disabled-clients '(ruby-ls lsp-ruby-ls rubocop-ls ruby-syntax-tree-ls typeprof-ls))
  :hook
  (ruby-mode . lsp)
  (typescript-ts-mode . lsp)
  (web-mode . lsp)
  )

(setq lsp-sorbet-as-add-on t)
(setq lsp-sorbet-use-bundler t)

;; don't work above settings for some reason
(add-hook 'tsx-ts-mode-hook 'lsp)
;;; 19-prg-lsp.el ends here
