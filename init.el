;;; init.el --- emacs config
;;; Commentary:
;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

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
        (progn (my-make-scratch 0) nil) t))))
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
(require 'dired)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-t") 'other-window-or-split))

; popup
(use-package popwin :ensure t :config (popwin-mode 1))

;; minibuffer

(fido-vertical-mode)
(use-package orderless
  :ensure t)
(add-hook 'minibuffer-setup-hook
          (lambda ()
            (setq-local completion-styles '(orderless))) t)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 1000)
(setq recentf-max-saved-items 1000)
(defun my/recentf-open (file)
  "Open FILE from recentf-list with fixed order."
  (interactive
   (list
    (completing-read "Open recent file: "
                     (lambda (string pred action)
                       (if (eq action 'metadata)
                           '(metadata (display-sort-function . identity)
                                      (cycle-sort-function . identity))
                         (complete-with-action action recentf-list string pred)))
                     nil t)))
  (find-file file)
  (recentf-add-file file))
(global-set-key (kbd "C-x C-r") 'my/recentf-open)
(use-package icomplete
  :config
  (defun my/fido-backward-delete ()
    "Delete one character backward instead of deleting directory."
    (interactive)
    (delete-char -1))
  (define-key icomplete-fido-mode-map (kbd "DEL") 'my/fido-backward-delete)
  (define-key icomplete-fido-mode-map (kbd "TAB") 'icomplete-force-complete))

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
(setq whitespace-style '(face space-mark spaces tab-mark tabs trailing))
(setq whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1])
     (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
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

;; editor

(use-package undo-tree :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;;; ================================================================
;;; programming
;;; ================================================================

;; grep
(use-package deadgrep
  :ensure t
  :config
  (setq deadgrep-extra-arguments '("--sort=path"))
  :bind
  ("C-c g" . deadgrep))

;; Git

(use-package magit :ensure t)

;; misc

(use-package company :ensure t)
(use-package yafolding :ensure t
  :hook
  (ruby-mode . yafolding-mode)
  :bind
  ("C-c f" . yafolding-toggle-element))
(use-package string-inflection :ensure t :bind ("C-c i" . string-inflection-cycle))

;; lint

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :config
  (setq flymake-show-diagnostics-at-end-of-line t))

(use-package flymake-eslint
  :ensure t
  :custom
  (flymake-eslint-executable-name "eslint_d"))

(declare-function flymake-eslint-enable "flymake-eslint")

;; LSP

(use-package eglot
  :ensure t)

;; Each language

(use-package coffee-mode :ensure t :mode "\\.coffee\\'")

(use-package csv-mode :ensure t :mode "\\.csv\\'")

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :hook (go-mode . eglot-ensure)
  :custom
  (gofmt-command "goimports")
  :config
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package typescript-ts-mode
  :ensure t
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode))
  :hook ((typescript-ts-mode tsx-ts-mode) .
         (lambda ()
           (eglot-ensure)
           (add-hook 'eglot-managed-mode-hook
                     (lambda ()
                       (when-let ((root (locate-dominating-file default-directory ".git")))
                         (setq-local flymake-eslint-project-root root))
                       (flymake-eslint-enable))
                     nil t))))

(use-package yaml-mode :ensure t)

(use-package markdown-mode :ensure t :mode "\\.md\\'" "\\.markdown\\'")

(use-package protobuf-mode :ensure t :mode "\\.proto\\'")

(use-package ruby-mode :ensure t
  :config
  (setq ruby-insert-encoding-magic-comment nil)
  (add-hook 'ruby-mode-hook
            (lambda ()
              (add-hook 'after-save-hook
                        (lambda ()
                          (let* ((git-root (locate-dominating-file default-directory ".git"))
                                 (cmd (format "cd %s && bundle exec stree write %s"
                                            git-root buffer-file-name)))
                            (async-shell-command cmd)))  ;; 非同期にしろ
                        nil t)))
  (bind-keys :map ruby-mode-map ("M-." . dumb-jump-go)))

;; (use-package ruby-mode :ensure t
;;   :config
;;   ;; https://emacs.stackexchange.com/questions/5452/before-save-hook-for-cc-mode
;;   (add-hook 'ruby-mode-hook (lambda () (add-hook 'after-save-hook (lambda () (shell-command (format "cd %s && bundle ex stree write %s" (locate-dominating-file default-directory ".git") buffer-file-name))) nil t)))
;;   (setq ruby-insert-encoding-magic-comment nil)
;;   (bind-keys :map ruby-mode-map
;;              ("M-." . dumb-jump-go))
;;   )
(use-package rspec-mode :ensure t
  :config
  (add-hook 'after-init-hook 'inf-ruby-switch-setup)
  (setenv "PAGER" (executable-find "cat")))
(use-package inf-ruby :ensure t)

;; formatter

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
  (prettier-js-mode . my/use-prettier-from-node-modules)
  (tsx-ts-mode-hook . prettier-js-mode)
  (typescript-ts-mode . prettier-js-mode)
  (web-mode . prettier-js-mode))

;; jump

(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-force-searcher 'ag))

(setq treesit-language-source-alist
      '((json "https://github.com/tree-sitter/tree-sitter-json")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (go "https://github.com/tree-sitter/tree-sitter-go")))
(dolist (element treesit-language-source-alist)
  (let* ((lang (car element)))
    (if (treesit-language-available-p lang)
        (message "treesit: %s is already installed" lang)
      (message "treesit: %s is not installed" lang)
      (treesit-install-language-grammar lang))))

;;; init.el ends here
