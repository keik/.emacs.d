(setq ruby-insert-encoding-magic-comment nil)
(unless (require 'rbenv nil 'noerror)
  (package-install 'rbenv))
(global-rbenv-mode)
