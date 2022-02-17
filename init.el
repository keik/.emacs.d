(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
;;(package-refresh-contents)

(unless (require 'use-package nil t)
  (package-install 'use-package))

;; load inits
(unless (require 'init-loader nil t)
  (package-install 'init-loader))

(init-loader-load)
