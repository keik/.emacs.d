(defvar *installp* nil)

;; install and load packages
(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (and *installp* (require 'package nil 'noerror))
  (package-refresh-contents)
  (defvar dependencies
    '(
       init-loader

       auto-complete
       popup
       pos-tip
       session
       redo+
       exec-path-from-shell

       ;;; window, buffer
       popwin
       direx
       minibuf-isearch

       ;;; programing
       flycheck
       editorconfig
       yasnippet

       ;;; Java
       ;; malabar-mode

       ;;; YAML
       yaml-mode

       ;;; PHP
       php-mode

       ;;; HTML / CSS/ JavaScript
       ;; sws-mode jade-mode
       web-mode
       js2-mode
       json-mode

       ;;; Erlang
       ;; erlang

       ;;; Common Lisp
       ;; slime

       ;;; HTML
       zencoding-mode

       ;;; documentation
       markdown-mode
       ))

  (dolist (package dependencies)
    (unless (package-installed-p package)
      (package-install package))))

;; run as server
(require 'server)
(unless (server-running-p)
  (server-start))

;; disable uselessies
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; load inits
(require 'init-loader)
(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/todo.org")))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black"))))
 '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue")))))
