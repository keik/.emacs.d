;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq debug-on-error t)

;;; =========================================================
;;; install

(when (require 'package nil 'noerror)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  ;;(dolist
  ;;  (package
  ;;    '(
  ;;      ;;; basic
  ;;       auto-install
  ;;       auto-complete
  ;;       fuzzy
  ;;       popup
  ;;       pos-tip
  ;;       session
  ;;       redo+
  ;;       exec-path-from-shell
  ;;
  ;;      ;;; window, buffer
  ;;       popwin
  ;;       direx
  ;;
  ;;      ;;; programing
  ;;       flycheck
  ;;       editorconfig
  ;;       yasnippet
  ;;
  ;;      ;;; Java
  ;;       malabar-mode
  ;;
  ;;      ;;; JavaScript
  ;;       sws-mode jade-mode
  ;;       js2-mode
  ;;
  ;;      ;;; Erlang
  ;;       ;;erlang
  ;;
  ;;      ;;; Common Lisp
  ;;       ;;slime
  ;;
  ;;      ;;; HTML
  ;;       zencoding-mode
  ;;
  ;;       ;;; documentation
  ;;       ;;markdown-mode
  ;;       ))
  ;;  (unless (package-installed-p package)
  ;;    (package-install package)))
  )

;;(when (require 'auto-install nil 'noerror))

;;; =========================================================
;;; environment

(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(setq env-w window-system)
(setq env-os system-type)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(add-to-list 'load-path "~/.emacs.d/elisp")

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;; proxy
;;(setq url-proxy-services '(("http" . "xxx.xxx.xxx.xxx:xxxx")))

;; ---------------------------------------------------------
;; window, buffer

(setq inhibit-startup-message t)
;;(set-frame-parameter (selected-frame) 'alpha '(1.0))
(menu-bar-mode t)
(tool-bar-mode 0)
(column-number-mode t)

;; show return code
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; linum
(global-linum-mode t)
(setq linum-format "%4d")
(set-face-attribute 'linum nil
  :foreground "#383"
  :height 0.8)

;; add directory name in buffer ;?
;;(when (require 'uniquify nil 'noerror)
;;  (setq uniquify-buffer-name-style 'forward)
;;  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;;  (setq uniquify-ignore-buffers-re "*[^*]+*") )

;; direx
(when (require 'direx nil 'noerror)
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
  (setq direx:leaf-icon "   "
    direx:open-icon " \x25bc"
    direx:closed-icon " \x25b6") )

;; popwin
(when (require 'popwin nil 'noerror)
  (setq display-buffer-function 'popwin:display-buffer)
  (push '(direx:direx-mode :position left :width 50 :dedicated t)
    popwin:special-display-config)
  (push '("^\\*Backtrace\\*$" :regexp t) popwin:special-display-config))

;; indent
;;(setq-default indent-tabs-mode nil)

;; ---------------------------------------------------------
;; color

;; color-theme
(load-theme 'wombat)
(set-frame-parameter (selected-frame) 'alpha '(85 70))

(custom-set-faces
  '(default ((t (:background "black")))))
(set-face-foreground 'mode-line "#dddddd")
(set-face-background 'mode-line "#114444")
(set-face-foreground 'mode-line-inactive "#bbbbbb")
(set-face-background 'mode-line-inactive "#333333")

;; emphasize whitespace
(when (require 'whitespace nil 'noerror)
  (setq whitespace-style '(face
                            tabs
                            trailing
                            tab-mark
                            spaces
                            space-mark)))

(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
  '((space-mark ?\x3000)
     (tab-mark   ?\t   [?\xBB ?\t])))

(set-face-foreground 'whitespace-tab "#444444")
(set-face-background 'whitespace-tab nil)
(set-face-underline  'whitespace-tab nil)

(set-face-foreground  'whitespace-space nil)
(set-face-underline  'whitespace-space nil)
(set-face-background 'whitespace-space "#444444")

(set-face-foreground  'whitespace-trailing nil)
(set-face-underline  'whitespace-trailing nil)
(set-face-background 'whitespace-trailing "#444444")

(global-whitespace-mode t)

;; emphasize parenthesis
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face "#114444")

;; region
(set-face-background 'region "#444411")

;; =========================================================
;; font

(cond
  ;; Linux
  ((and (eq env-w 'x) (eq env-os 'gnu/linux))
    (add-to-list 'default-frame-alist
      '(font . "-unknown-Ricty-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1")))
  ;; Mac
  ((and (eq env-w 'ns) (eq env-os 'darwin)))
  ;; Windows
  ((and (eq env-w 'w32) (eq env-os 'windows-nt))
    (set-face-attribute 'default nil :family "Migu 1M" :height 110)))

;;; =========================================================
;;; window, buffer

;; auto-complete
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20131128.233/dict/")
  (ac-config-default)
  (setq ac-use-fuzzy t)
  (global-auto-complete-mode t)
  (add-hook 'html-mode-hook 'auto-complete-mode)
  (define-key ac-mode-map (kbd "TAB") 'ac-start)
  (define-key ac-completing-map (kbd "TAB") 'auto-complete)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (setq ac-auto-show-menu 0)

  ;;; Add ac-sources
  (add-hook 'html-mode-hook
    (lambda () (add-to-list 'ac-sources 'ac-source-yasnippet)))
  (add-hook 'css-mode-hook
    (lambda () (add-to-list 'ac-sources 'ac-source-yasnippet)))
  (add-hook 'js2-mode-hook
    (lambda () (add-to-list 'ac-sources 'ac-source-yasnippet)))
  )

;; redo+
(when (require 'redo+ nil 'noerror)
  (setq undo-no-redo t)
  (define-key global-map (kbd "C-?") 'redo)
  (define-key global-map (kbd "C-M-_") 'redo))

;; switch window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>")
  (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "<C-S-tab>")
  (lambda () (interactive) (other-window -1)))
(cond (window-system
        (setq x-select-enable-clipboard t)))

;; isearch in minibuffuer
;; (auto-install-from-url "http://www.sodan.org/~knagano/emacs/minibuf-isearch/minibuf-isearch.el")
(when (require 'minibuf-isearch nil 'noerror))

;; session
(when (require 'session nil 'noerror)
  (setq session-initialize '(de-saveplace session keys menus places)
    session-globals-include '((kill-ring 50)
                               (session-file-alist 500 t)
                               (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  (setq history-length t))

;; keep cursor position in closed buffer
(setq session-undo-check -1)
;;
;; buffer switching
(ido-mode t)
(delete '(find-file . ido-find-file) ;disable ido-find-file
  (cdr (cdaddr ido-minor-mode-map-entry)))

;; bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; keep *scratch* buffer
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

;; rectangle select
(cua-mode t)
(setq cua-enable-cua-keys nil)
(setq cua-mode-enable-cua-keys nil)

;; scroll each one line
(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)
;;(setq comint-scroll-show-maximum-output nil)

;; delete whitespaces at save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; =========================================================
;;; Input

(cond
  ;; Linux
  ((and (eq env-w 'x) (eq env-os 'gnu/linux))
    (prefer-coding-system 'utf-8)
    (set-default-coding-systems 'utf-8)

                                        ;(setq coding-system-for-read 'utf-8)
                                        ;(setq coding-system-for-write 'utf-8)
    )

  ;; Windows
  ((and (eq env-w 'w32) (eq env-os 'windows-nt))
    (prefer-coding-system 'utf-8-dos)
    (set-file-name-coding-system 'cp932)
    (setq default-process-coding-system '(cp932 . cp932))
    (set-terminal-coding-system 'cp932)
    (coding-system-put 'cp932 :mnemonic ?P)
    (coding-system-put 'cp932-dos :mnemonic ?P)
    (coding-system-put 'cp932-unix :mnemonic ?P)
    (coding-system-put 'cp932-mac :mnemonic ?P)))

;; IME
(cond
  ;; Linux
  ((and (eq env-w 'x) (eq env-os 'gnu/linux))
    (require 'uim)
    (setq default-input-method "japanese-anthy-utf8-uim")
    (setq uim-default-im-prop '("action_anthy_utf8_hiragana"))
    (setq uim-candidate-display-inline t)
    (global-set-key (kbd "S-SPC") 'uim-mode)
    (defadvice uim-mode (after uim-mode-change-cursor-color)
      (set-face-background 'cursor (if ad-return-value "#3a3" "#666")))
    (ad-activate 'uim-mode 'uim-mode-change-cursor-color))
  ;; Mac
  ((and (eq env-w 'ns) (eq env-os 'darwin)))
  ;; Windows
  ((and (eq env-w 'w32) (eq env-os 'windows-nt))
    (setq default-input-method "W32-IME")
    (w32-ime-initialize)

    (add-hook 'post-command-hook
      (lambda() (if (ime-get-mode)
                  (set-cursor-color "#ff5555")
                  (set-cursor-color "#88ccff"))))
    ;; IME off at minibuffer
    (defvar *ime-mode-into-minibuffer* nil)
    (defun ime-state-get-and-setoff (bef-buffer file-name)
      (interactive)
      (setq *ime-mode-into-minibuffer* (ime-get-mode))
      (toggle-ime nil))
    (defun ime-state-set (bef-buffer file-name)
      (interactive)
      (toggle-ime *ime-mode-into-minibuffer*))
    (add-hook '*enter-minibuffer-hook* 'ime-state-get-and-setoff)
    (add-hook '*exit-minibuffer-hook* 'ime-state-set)))

;; meta key bind
(cond
  ;; Mac
  ((and (eq env-w 'ns) (eq env-os 'darwin))
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)))


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
(add-hook 'html-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'flycheck-mode)

;; ---------------------------------------------------------
;; HTML, CSS

;; zencoding
(when (require 'zencoding-mode nil 'noerror)
  (add-hook 'html-mode-hook 'zencoding-mode))

;; css-mode
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; ---------------------------------------------------------
;; Java

(require 'cedet)
(require 'semantic)
(semantic-mode 1)
(require 'malabar-mode)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))
(add-hook 'java-mode-hook
  (lambda ()
    (define-key java-mode-map (kbd "C-c C-c") 'compile)
    (set (make-local-variable 'compile-command)
      (let ((file (file-name-nondirectory buffer-file-name)))
        (format "jc %s" file)))))

;; ---------------------------------------------------------
;; JavaScript

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; jade-mode
(when (require 'sws-mode nil 'noerror))
(when (require 'jade-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
  (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)))

;; ---------------------------------------------------------
;; Perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
  '(lambda ()
     (make-local-variable 'compile-command)
     (setq compile-command
       (concat "perl " (buffer-file-name)))
     (cperl-define-key "\C-c\C-c" 'compile)))

;; ---------------------------------------------------------
;; Documentation

;; markdown-mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; rst-mode
;; none

;; ---------------------------------------------------------
;; Erlang

;; erlang-mode
;;(if (file-exists-p "/usr/lib64/erlang")
;;  (progn (add-to-list 'load-path "/usr/lib64/erlang/lib/tools-2.6.6.5/emacs/")
;;    (setq erlang-root-dir "/usr/lib64/erlang")
;;    (add-to-list 'exec-path "/usr/lib64/erlang/bin")
;;    (require 'erlang-start)
;;    (autoload 'erlang-start "erlang-mode" nil t)))

;; ---------------------------------------------------------
;; Lisp

;; Common Lisp
(when (require 'slime nil 'noerror)
  (add-hook 'lisp-mode-hook
    (lambda ()
      (slime-mode t)
      (show-paren-mode)))
  (slime-setup '(slime-repl))
  (setq slime-net-coding-system 'utf-8-dos))

;; http://modern-cl.blogspot.jp/
;;(push '("*slime-apropos*") popwin:special-display-config)
;;(push '("*slime-macroexpansion*") popwin:special-display-config)
;;(push '("*slime-description*") popwin:special-display-config)
;;(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;;(push '("*slime-xref*") popwin:special-display-config)
;;(push '(sldb-mode :stick t) popwin:special-display-config)
;;(push '(slime-repl-mode) popwin:special-display-config)
;;(push '(slime-connection-list-mode) popwin:special-display-config)
;;(require 'ac-slime)
;;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;;(eval-after-load "auto-complete"
;;  '(add-to-list 'ac-modes 'slime-repl-mode))

;;; =========================================================
;;; shell

(cond
  ;; Linux
  ((and (eq env-w 'x) (eq env-os 'gnu/linux))
    ;;(when (require 'exec-path-from-shell nil 'noerror)
    (exec-path-from-shell-initialize))
  ;;)
  ;; Mac
  ((and (eq env-w 'ns) (eq env-os 'darwin)))
  ;; Windows
  ((and (eq env-w 'w32) (eq env-os 'windows-nt))
    (progn
      (require 'shell)
      (setq explicit-shell-file-name "bash.exe")
      (setq shell-command-switch "-c")
      (setq shell-file-name "bash.exe")

      ;; (M-! and M-| and compile.el)
      (setq shell-file-name "bash.exe")
      (modify-coding-system-alist 'process ".*sh\\.exe" 'cp932)

      ;; shellモードの時の^M抑制
      (add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

      ;; shell-modeでの補完 (for drive letter)
      (setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@'`.,;()-")

      ;; エスケープシーケンス処理の設定
      (autoload 'ansi-color-for-comint-mode-on "ansi-color"
        "Set `ansi-color-for-comint-mode' to t." t)

      (setq shell-mode-hook
        (function
          (lambda ()

            ;; シェルモードの入出力文字コード
            (set-buffer-process-coding-system 'sjis-dos 'sjis-unix)
            (set-buffer-file-coding-system    'sjis-unix)
            ))))))


;;----
