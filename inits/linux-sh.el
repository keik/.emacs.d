;;(when (require 'exec-path-from-shell nil 'noerror)
(ignore-errors (exec-path-from-shell-initialize))
(unless (require 'multi-term nil 'noerror)
  (auto-install-from-url "http://www.emacswiki.org/emacs/download/multi-term.el"))
