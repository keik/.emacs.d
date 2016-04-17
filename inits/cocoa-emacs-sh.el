(unless (require 'exec-path-from-shell nil 'noerror)
  (package-install 'exec-path-from-shell))
(exec-path-from-shell-initialize)
