;;; init.el --- emacs config
;;; Commentary:
;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; load inits
;; TODO: Remove
(unless (require 'init-loader nil t)
  (package-install 'init-loader))
(init-loader-load)

;;; ================================================================
;;; basic
;;; ================================================================

;; global config

(require 'server)
(unless (server-running-p) (server-start))
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)
(defvar grep-save-buffers nil)
(setq scroll-conservatively 1)
(setq auto-save-default nil) ; not create autosave file like #init.el#
(setq create-lockfiles nil) ; not create lock file like .#init.el
(setq make-backup-files nil) ; not create backup file like init.el~
(delete-selection-mode t)
(global-auto-revert-mode 1)
(global-display-line-numbers-mode t)
(global-unset-key "\C-z")
(menu-bar-mode 0)
(savehist-mode 1)
(show-paren-mode)
(tool-bar-mode 0)

;; buffer and window

(global-set-key (kbd "C-x C-b") 'bs-show)

; mode line
(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-undecided "??")
(column-number-mode t)
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1))
; show recent directory of current file
(setq-default mode-line-buffer-identification
  (cons
    '(:eval (replace-regexp-in-string "^.*/\\(.*\\)/" "(\\1/) " default-directory))
    mode-line-buffer-identification))

; keep scratch buffer
(add-hook 'after-save-hook
  (function
    (lambda ()
      (unless
        (member "*scratch*" (mapcar (function buffer-name) (buffer-list)))
        (my-make-scratch 1)))))
(add-hook 'kill-buffer-query-functions
  (function
    (lambda ()
      (if (string= "*scratch*" (buffer-name))
        (progn (my-make-scratch 0) nil)
        t))))
(defun my-make-scratch (&optional arg)
  "Create scratch buffer always.
Specify to clear or create scratch buffer with ARG"
  (interactive)
  (progn
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg
      (progn (setq arg 0)
        (switch-to-buffer "*scratch*")))
    (cond ((= arg 0) (message "*scratch* is cleared up."))
      ((= arg 1) (message "another *scratch* is created")))))

(defun other-window-or-split ()
  "Move other window, with split if window is none."
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; theme

(use-package cyberpunk-theme
  :ensure t
  :config
   (load-theme 'cyberpunk t)
   (set-face-background 'default "unspecified-bg")
   (set-face-foreground 'font-lock-comment-face "#AAAAAA"))

; whitespaces
(global-whitespace-mode)
(require 'whitespace)
(setq whitespace-style '(face
                          tabs
                          trailing
                          tab-mark
                          spaces
                          space-mark))
(setq whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1])
     (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
; (tab-mark   ?\t	  [?\xBB ?\t])
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#666666")
(set-face-background 'whitespace-tab nil)
(set-face-underline  'whitespace-tab nil)
(set-face-foreground 'whitespace-space nil)
(set-face-background 'whitespace-space nil)
(set-face-underline  'whitespace-space nil)
(set-face-foreground 'whitespace-trailing nil)
(set-face-background 'whitespace-trailing "#666666")
(set-face-underline  'whitespace-trailing nil)

(use-package helm
  :ensure t
  :bind
  ;;("C-x b" . helm-buffers-list)
  ("C-x C-f" . helm-find-files)
  ("C-x C-r" . helm-recentf)
  ("C-x b" . helm-mini)
  ("M-x" . helm-M-x)
  ("M-y" . helm-show-kill-ring)
  :config
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action)
  (define-key helm-map (kbd "C-w")  'kill-region) ;; helm セクションで無効化される C-w kill-region を復活
  )
;; おためし
(require 'recentf)
(setq recentf-max-menu-items 1000)
(setq recentf-max-saved-items 1000)

(use-package popwin :ensure t :config (popwin-mode 1))

(use-package undo-tree :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

(use-package magit :ensure t)

(use-package helm-git-grep
  :ensure t
  :bind
  ("C-c g" . helm-git-grep)
  :config
  (setq helm-allow-mouse nil)
  (setq helm-git-grep-pathspecs '(":!*.storyshot")))

;;; ================================================================
;;; programming
;;; ================================================================

;; format
(defun my/use-prettier-from-node-modules ()
  "Use node_modules/.bin/prettier if exists."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (prettier (if root
                       (expand-file-name "node_modules/.bin/prettier" root)
                     "prettier")))
    (when (and prettier (file-executable-p prettier))
      (setq-local prettier-js-command prettier))))
(use-package prettier-js
  :ensure t
  :hook
  (web-mode . prettier-js-mode)
  (typescript-ts-mode . prettier-js-mode)
  (prettier-js-mode . my/use-prettier-from-node-modules))

(use-package company :ensure t)
(use-package yafolding :ensure t
  :hook
  (ruby-mode . yafolding-mode)
  :bind
  ("C-c f" . yafolding-toggle-element))
(use-package string-inflection :ensure t :bind ("C-c i" . string-inflection-cycle))

;; each languages
(use-package coffee-mode :ensure t :mode "\\.coffee$")
(use-package csv-mode :ensure t :mode "\\.csv$")
(use-package go-mode :ensure t :mode "\\.go$"
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save))
(use-package ruby-mode :ensure t
  :config
  ;; https://emacs.stackexchange.com/questions/5452/before-save-hook-for-cc-mode
  (add-hook 'ruby-mode-hook (lambda () (add-hook 'before-save-hook 'lsp-format-buffer nil 'local)))
  (add-hook 'ruby-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (shell-command (format "cd %s && bundle ex stree write %s" (locate-dominating-file default-directory ".git") buffer-file-name))) nil t)))
  (setq ruby-insert-encoding-magic-comment nil)
  (bind-keys :map ruby-mode-map
             ("M-." . dumb-jump-go))
  )
(use-package rspec-mode :ensure t
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  (setenv "PAGER" (executable-find "cat")))
(use-package inf-ruby :ensure t)
(use-package typescript-ts-mode :ensure t :mode "\\.mts$" "\\.ts$" "\\.tsx$")
(use-package yaml-mode :ensure t)
(use-package markdown-mode :ensure t :mode "\\.md$" "\\.markdown$")
(use-package protobuf-mode :ensure t :mode "\\.proto$")

;; jump
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-force-searcher 'ag))

;;; init.el ends here
