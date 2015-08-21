;;; =========================================================
;;; programming

;; ---------------------------------------------------------
;; general

;; editorconfig
;; https://github.com/editorconfig/editorconfig-core-c/blob/master/INSTALL.md
(load "editorconfig" 'noerror)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-keep-variants nil)

;; yasnippet
(when (require 'yasnippet nil 'noerror)
  (yas-global-mode 1))

;; flycheck
(when (require 'flycheck nil 'noerror)
  (add-hook 'web-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (setq-default flycheck-disabled-checkers
    (append flycheck-disabled-checkers
      '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'java-mode-hook 'flycheck-mode))


;; ---------------------------------------------------------
;; JavaScript

;; js-mode
(setq js-indent-level 2)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . js2-mode))
(setq js2-strict-missing-semi-warning nil)

;; jade-mode
(when (require 'sws-mode nil 'noerror))
(when (require 'jade-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
  (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)))
