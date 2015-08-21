(defvar *installp* nil)
(defvar *updatep* nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (and *installp* (require 'package nil 'noerror))
  (package-refresh-contents)
  (defvar dependencies
    '(
       init-loader

       auto-install
       auto-complete
       popup
       pos-tip
       session
       redo+
       exec-path-from-shell

       ;;; window, buffer
       popwin
       direx

       ;;; programing
       flycheck
       editorconfig
       yasnippet

       ;;; Java
       ;; malabar-mode

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

(add-to-list 'load-path "~/.emacs.d/auto-install")
(when (and *updatep* (require 'auto-install nil t))
  (setq auto-install-directory "~/.emacs.d/auto-install/")
  (auto-install-update-emacswiki-package-name t))
