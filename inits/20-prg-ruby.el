(setq ruby-insert-encoding-magic-comment nil)
(unless (require 'rbenv nil 'noerror)
  (package-install 'rbenv))
(global-rbenv-mode)

(unless (require 'rufo nil 'noerror)
  (package-install 'rufo))

(unless (require 'rspec-mode nil 'noerror)
  (package-install 'rspec-mode))

(unless (require 'inf-ruby nil 'noerror)
  (package-install 'inf-ruby))
(setenv "PAGER" (executable-find "cat"))
(setq inf-ruby-prompt-read-only nil)

(setq rspec-use-spring-when-possible nil)

(add-hook 'after-init-hook 'inf-ruby-switch-setup)
