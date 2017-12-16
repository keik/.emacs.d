(unless (require 'nyan-mode nil t)
  (package-install 'nyan-mode))
(nyan-mode)

(setq eol-mnemonic-dos "CRLF")
(setq eol-mnemonic-mac "CR")
(setq eol-mnemonic-unix "LF")
(setq eol-mnemonic-undecided "??")

(column-number-mode t)
(line-number-mode t)

;;; display for minor mode
(defvar mode-line-cleaner-alist
  `(
     (auto-complete-mode . "α ")
     (auto-revert-mode . "")
     ;;(paredit-mode . " π")
     ;;(eldoc-mode . "")
     ;;(abbrev-mode . "")
     (anzu-mode . "")
     (editorconfig-mode . "")
     (emacs-lisp-mode . "EL ")
     (emmet-mode . "ε ")
     (flycheck-mode . "φ ")
     (git-gutter-mode . "")
     (global-whitespace-mode . "")
     (lisp-interaction-mode . "λ ")
     ;;(hi-lock-mode . "")
     (prettier-js-mode . "☆ ")
     (python-mode . "PY ")
     ;;(nxhtml-mode . "nx")
     (markdown-mode . "MD ")
     (undo-tree-mode . "θ ")
     (yas-minor-mode . "υ ")
     (web-mode . "∑ ")
     ))

(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
    do (let* ((mode (car cleaner))
               (mode-str (cdr cleaner))
               (old-mode-str (cdr (assq mode minor-mode-alist))))
         (when old-mode-str
           (setcar old-mode-str mode-str))
         ;; major mode
         (when (eq mode major-mode)
           (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

(unless (require 'anzu nil t)
  (package-install 'anzu))
(global-anzu-mode +1)

(setq-default mode-line-buffer-identification
  (cons
    '(:eval (replace-regexp-in-string "^.*/\\(.*\\)/" "(\\1/) " default-directory))
    mode-line-buffer-identification))
