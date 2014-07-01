; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; =========================================================
;;; install

(when (require 'package nil 'noerror)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
  (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
  (package-initialize)
  (dolist
      (package
       '(
         ;;; basic
         auto-install
         auto-complete
         fuzzy
         popup
         pos-tip
         session
         redo+
         exec-path-from-shell
         ;;; window, buffer
         popwin
         direx
         ;;; looks
         color-theme
         ;; tabbar
         ;;; programing
         editorconfig
         yasnippet
         ;;; JavaScript
         ;; sws-mode jade-mode
         js2-mode
         ;;; Erlang
         ;; erlang
         ;;; Common Lisp
         ;; slime
         ;;; HTML
         zencoding-mode
         ;;; documentation
         ;; markdown-mode
                       ))
    (unless (package-installed-p package)
      (package-install package))) )

(when (require 'auto-install nil 'noerror))

;;; =========================================================
;;; environment

;; (set-language-environment "Japanese")
(setq env-w window-system)
(setq env-os system-type)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(add-to-list 'load-path "~/.emacs.d/elisp")

(exec-path-from-shell-initialize)

;; proxy
;;(setq url-proxy-services '(("http" . "xxx.xxx.xxx.xxx:xxxx")))

;; =========================================================
;; window, buffer
(setq inhibit-startup-message t)
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))
(set-frame-parameter (selected-frame) 'alpha '(1.0))
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)

;; linum
(global-linum-mode t)
(setq linum-format "%4d")
(set-face-attribute 'linum nil
                    :foreground "#383"
                    :height 0.8)

;; add directory name in buffer ;?
(when (require 'uniquify nil 'noerror)
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets)
  (setq uniquify-ignore-buffers-re "*[^*]+*") )

;; direx
(when (require 'direx nil 'noerror)
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
  (setq direx:leaf-icon "   "
        direx:open-icon " \x25bc"
        direx:closed-icon " \x25b6") )

;; popwin
(when (require 'popwin nil 'noerror)
  (setq display-buffer-function 'popwin:display-buffer)
  (push '(direx:direx-mode :position left :width 36 :dedicated t)
        popwin:special-display-config)
  (push '("^\\*Backtrace\\*$" :regexp t) popwin:special-display-config) )

;; indent
;;(setq-default indent-tabs-mode nil)

;; =========================================================
;; color

;; color-theme
(when (require 'color-theme nil 'noerror)
  (eval-after-load "color-theme"
    '(progn
       (color-theme-initialize)
       (color-theme-simple-1))) )

(set-face-foreground 'mode-line "#222222")
(set-face-background 'mode-line "#ff8899")
(set-face-foreground 'mode-line-inactive "#bbbbbb")
(set-face-background 'mode-line-inactive "#333333")

;; emphasize whitespace ;?
(setq-default show-trailing-whitespace t)
(when (require 'whitespace nil 'noerror)
  (setq whitespace-style '(face
                           tabs
                           tab-mark
                           spaces
                           space-mark)) )

(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000)
        (tab-mark   ?\t   [?\xBB ?\t]) ))
(set-face-foreground 'whitespace-tab "#444444")
(set-face-background 'whitespace-tab 'nil)
(set-face-underline  'whitespace-tab nil)
(set-face-foreground 'whitespace-space nil)
(set-face-background 'whitespace-space "#444444")
(set-face-bold-p 'whitespace-space t)
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
               '(font . "-unknown-VL Gothic-normal-normal-normal-*-14-*-*-*-*-0-iso10646-1")) )
 ;; Mac
 ((and (eq env-w 'ns) (eq env-os 'darwin)) )
 ;; Windows
 ((and (eq env-w 'w32) (eq env-os 'windows-nt))
  (set-face-attribute 'default nil :family "Migu 1M" :height 110) ))

;;; =========================================================
;;; window, buffer

;; auto-complete
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20131128.233/dict/")
  (ac-config-default)
  (setq ac-use-fuzzy t)
  (global-auto-complete-mode t)
  (add-hook 'html-mode-hook 'auto-complete-mode)
  ;; キーバインド微調整
  ;;(global-set-key (kbd "<tab>") 'ac-start) ; tabで自動補完モード開始
  (define-key ac-mode-map (kbd "<tab>") 'ac-start) ; tabで自動補完モード開始
  (define-key ac-completing-map (kbd "<tab>") 'auto-complete) ; tabで補完できるところまで補完
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (setq ac-auto-show-menu 0) )

;; redo+
(when (require 'redo+ nil 'noerror)
  (setq undo-no-redo t)
  (define-key global-map (kbd "C-?") 'redo)
  (define-key global-map (kbd "C-M-_") 'redo) )
;; switch window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>")
                (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "<C-S-tab>")
                (lambda () (interactive) (other-window -1)))
(cond (window-system
       (setq x-select-enable-clipboard t) ))

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
  (setq history-length t) )

;; keep cursor position in closed buffer
(setq session-undo-check -1)

;; iswitchb
(iswitchb-mode 1)
(add-hook 'iswitchb-define-mode-map-hook
          (lambda()
            (define-key iswitchb-mode-map (kbd "C-n") 'iswitchb-next-match)
            (define-key iswitchb-mode-map (kbd "C-p") 'iswitchb-prev-match)
            (define-key iswitchb-mode-map (kbd "C-f") 'iswitchb-next-match)
            (define-key iswitchb-mode-map (kbd "C-b") 'iswitchb-prev-match) ))

;; bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; keep *scratch* buffer
(add-hook 'after-save-hook
          (function (lambda ()
                      (unless (member "*scratch*" (mapcar (function buffer-name) (buffer-list)))
                        (my-make-scratch 1)))))
(add-hook 'kill-buffer-query-functions
          (function (lambda ()
                      (if (string= "*scratch*" (buffer-name))
                          (progn (my-make-scratch 0) nil)
                        t))))
(defun my-make-scratch (&optional arg)
  (interactive)
  (progn
    ;; "*scratch*" を作成して buffer-list に放り込む
    (set-buffer (get-buffer-create "*scratch*"))
    (funcall initial-major-mode)
    (erase-buffer)
    (when (and initial-scratch-message (not inhibit-startup-message))
      (insert initial-scratch-message))
    (or arg (progn (setq arg 0)
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
(setq comint-scroll-show-maximum-output t)

;; delete whitespaces at save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; =========================================================
;;; Input

(cond
 ;; Linux
 ((and (eq env-w 'x) (eq env-os 'gnu/linux))
  (prefer-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8))
 ;; Windows
 ((and (eq env-w 'w32) (eq env-os 'windows-nt))
  (prefer-coding-system 'utf-8-dos)
  (set-file-name-coding-system 'cp932)
  (setq default-process-coding-system '(cp932 . cp932))
  (set-terminal-coding-system 'cp932)
  (coding-system-put 'cp932 :mnemonic ?P)
  (coding-system-put 'cp932-dos :mnemonic ?P)
  (coding-system-put 'cp932-unix :mnemonic ?P)
  (coding-system-put 'cp932-mac :mnemonic ?P) ))

;; IME
(cond
 ;; Linux
 ((and (eq env-w 'x) (eq env-os 'gnu/linux))
  (require 'ibus)
  (add-hook 'after-init-hook 'ibus-mode-on)
  (setq ibus-agent-file-name "~/.emacs.d/elisp/ibus-el-agent")
  (ibus-define-common-key ?\C-\s nil)
  (ibus-define-common-key ?\C-/ nil)
  (setq ibus-cursor-color '("#ff5555" "#88ccff" "#88ff88"))
  )
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
  (add-hook '*exit-minibuffer-hook* 'ime-state-set) ))

;; meta key bind
(cond
 ;; Mac
 ((and (eq env-w 'ns) (eq env-os 'darwin))
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)))

;;; =========================================================
;;; util

;; open
(cond
 ;; Linux
 ((and (eq env-w 'x) (eq env-os 'gnu/linux))
  (defun open ()
    (interactive)
    (start-process "nautilus" nil "nautilus" ".") ))
 ;; Mac
 ((and (eq env-w 'ns) (eq env-os 'darwin)))
 ;; Windows
 ((and (eq env-w 'w32) (eq env-os 'windows-nt))
  (defun open ()
    (interactive)
    (start-process "explorer" nil "explorer" ".") )))


;;; =========================================================
;;; programming

;;; ---------------------------------------------------------
;; general

;; editorconfig
;; https://github.com/editorconfig/editorconfig-core-c/blob/master/INSTALL.md
(load "editorconfig")

;; yasnippet
(when (require 'yasnippet nil 'noerror)
  (yas/global-mode 1) )

;; flymake
(when (require 'flymake nil 'noerror))
;; http://www.emacswiki.org/emacs/FlymakeHtml

(when (require 'flymake-html nil 'noerror)
  (add-hook 'html-mode-hook '(lambda () (flymake-mode t))) )

;;; ---------------------------------------------------------
;; Java
(add-hook 'java-mode-hook
          '(lambda ()
             (make-local-variable 'compile-command)
             (setq compile-command
                   (concat "javac " (buffer-file-name)))
             (define-key java-mode-map (kbd "C-c C-c") 'compile)))

;;; ---------------------------------------------------------
;; HTML, CSS

;; zencoding
(when (require 'zencoding-mode nil 'noerror)
  (add-hook 'html-mode-hook 'zencoding-mode))

;; css-mode
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;; ac
(add-hook 'html-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-yasnippet)))

;;; ---------------------------------------------------------
;; JavaScript

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
;; leave it to editorconfig
;;(setq-default js2-basic-offset 2)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; jade-mode
(when (require 'sws-mode nil 'noerror))
(when (require 'jade-mode nil 'noerror)
  (add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
  (add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode)) )

;;; ---------------------------------------------------------
;; Perl
(defalias 'perl-mode 'cperl-mode)
(add-hook 'cperl-mode-hook
          '(lambda ()
             (make-local-variable 'compile-command)
             (setq compile-command
                   (concat "perl " (buffer-file-name)))
             (cperl-define-key "\C-c\C-c" 'compile)))

;;; ---------------------------------------------------------
;; Documentation

;; markdown-mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; rst-mode
(add-hook 'rst-mode-hook
          (lambda ()
            (define-key rst-mode-map (kbd "C-c C-c") 'compile)
            (set (make-local-variable 'compile-command)
                 (let ((file (file-name-nondirectory buffer-file-name)))
                   (format "%s %s.rst -o %s.html"
                           "pandoc"
                           (file-name-sans-extension file)
                           (file-name-sans-extension file)
                           file)))))



;;; ---------------------------------------------------------
;; Erlang

;; erlang-mode
(if (file-exists-p "/usr/lib64/erlang")
    (progn (add-to-list 'load-path "/usr/lib64/erlang/lib/tools-2.6.6.5/emacs/")
     (setq erlang-root-dir "/usr/lib64/erlang")
     (add-to-list 'exec-path "/usr/lib64/erlang/bin")
     (require 'erlang-start)
     (autoload 'erlang-start "erlang-mode" nil t) ))

;;; ---------------------------------------------------------
;; Lisp

;; Common Lisp
(when (require 'slime nil 'noerror)
  (add-hook 'lisp-mode-hook (lambda ()
                              (slime-mode t)
                              (show-paren-mode)))
  (slime-setup '(slime-repl))
  (setq slime-net-coding-system 'utf-8-dos) )

;; http://modern-cl.blogspot.jp/
;; (push '("*slime-apropos*") popwin:special-display-config)
;; (push '("*slime-macroexpansion*") popwin:special-display-config)
;; (push '("*slime-description*") popwin:special-display-config)
;; (push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; (push '("*slime-xref*") popwin:special-display-config)
;; (push '(sldb-mode :stick t) popwin:special-display-config)
;; (push '(slime-repl-mode) popwin:special-display-config)
;; (push '(slime-connection-list-mode) popwin:special-display-config)
;; (require 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))


;;; =========================================================
;; tabbar
(when (require 'direx nil 'noerror)
  (message "hoge"))

(when (require 'tabbar nil 'noerror)
  (tabbar-mode)
  (tabbar-mwheel-mode -1)
  (setq tabbar-buffer-groups-function nil)
  ;; ボタン非表示
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))3
    (set btn (cons (cons "" nil) (cons "" nil))))
  ;; タブ表示 一時バッファ一覧
  (defvar tabbar-displayed-buffers
    '("*scratch*" "*Messages*" "*Backtrace*" "*Colors*"
      "*Faces*" "*Apropos*" "*Customize*" "*shell*" "*Help*")
    "*Regexps matches buffer names always included tabs.")

  ;; 作業バッファの一部を非表示
  (setq tabbar-buffer-list-function
        (lambda ()
          (let* ((hides (list ?\  ?\*))
                 (re (regexp-opt tabbar-displayed-buffers))
                 (cur-buf (current-buffer))
                 (tabs (delq
                        nil
                        (mapcar
                         (lambda (buf)
                           (let ((name (buffer-name buf)))
                             (when (or (string-match re name)
                                       (not (memq (aref name 0) hides)))
                               buf)))
                         (buffer-list)))))
            (if (memq cur-buf tabs)
                tabs
              (cons cur-buf tabs)))))

  (set-face-attribute 'tabbar-default nil
                      :background "#666666")
  (set-face-attribute 'tabbar-selected nil
                      :foreground "#444444"
                      :background "#eeeeee"
                      :box (list
                            :line-width -1
                            :color "#eeeeee")
                      :weight 'bold
                      )
  (set-face-attribute 'tabbar-unselected nil
                      :foreground "#444444"
                      :background "#aaaaaa"
                      :box (list
                            :line-width -1
                            :color "#aaaaaa")
                      )
  (set-face-attribute 'tabbar-separator nil
                      :height 0.1) )


;;; =========================================================
;; shell
(cond
 ;; Linux
 ((and (eq env-w 'x) (eq env-os 'gnu/linux)))
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
             )))) ))


;;----
