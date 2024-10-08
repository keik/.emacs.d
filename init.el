(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; load inits
(unless (require 'init-loader nil t)
  (package-install 'init-loader))

(init-loader-load)
