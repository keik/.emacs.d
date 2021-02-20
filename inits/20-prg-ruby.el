(use-package ruby-mode
  :ensure t
  :config
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
