;;; 20-prg-ruby.el --- settings for Ruby language
;;; Commentary:
;;; Code:
(use-package ruby-mode
  :ensure t
  :config
  ;; https://emacs.stackexchange.com/questions/5452/before-save-hook-for-cc-mode
  (add-hook 'ruby-mode-hook (lambda () (add-hook 'before-save-hook 'lsp-format-buffer nil 'local)))
  (add-hook 'ruby-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (shell-command (format "cd %s && bundle ex stree write %s" (locate-dominating-file default-directory ".git") buffer-file-name))) nil t)))

  (setq ruby-insert-encoding-magic-comment nil)
  (bind-keys :map ruby-mode-map
             ("M-." . dumb-jump-go))
  )

;; (unless (require 'rbenv nil 'noerror)
;;   (package-install 'rbenv))
;; (global-rbenv-mode)

;; (unless (require 'rufo nil 'noerror)
;;   (package-install 'rufo))

(use-package rspec-mode
  :ensure t
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  (setenv "PAGER" (executable-find "cat"))
  )

(use-package inf-ruby
  :ensure t)
;;   (package-install 'inf-ruby))
;; (setenv "PAGER" (executable-find "cat"))
;; (setq inf-ruby-prompt-read-only nil)

;; (setq rspec-use-spring-when-possible nil)

;; (add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; ;; (use-package ggtags
;; ;;   :ensure t
;; ;;   :hook (ruby-mode . ggtags-mode)
;; ;;   )

;;; 20-prg-ruby.el ends here
