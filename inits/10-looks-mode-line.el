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
  `((auto-complete-mode . " α")
     ;;(paredit-mode . " π")
     ;;(eldoc-mode . "")
     ;;(abbrev-mode . "")
     ;; Major modes
     (emacs-lisp-mode . "EL")
     (emmet-mode . "ε")
     (global-whitespace-mode . "")
     (flycheck-mode . " φ")
     (js2-mode . "JS")
     (lisp-interaction-mode . "λ")
     ;;(hi-lock-mode . "")
     (python-mode . "PY")
     ;;(nxhtml-mode . "nx")
     (markdown-mode . "MD")
     (undo-tree-mode . " θ")
     (yas-minor-mode . " υ")
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
