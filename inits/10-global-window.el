;; linum
(global-linum-mode t)
(setq linum-format "%4d")
(set-face-attribute 'linum nil :foreground "#383" :height 0.8)

;; direx
(when (require 'direx nil 'noerror)
  (global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
  (setq direx:leaf-icon ""
    direx:open-icon "[-] "
    direx:closed-icon "[+] "))

;; popwin
(when (require 'popwin nil 'noerror)
  (setq display-buffer-function 'popwin:display-buffer)
  (push '(direx:direx-mode :position left :width 50 :dedicated t)
    popwin:special-display-config)
  (push '("^\\*Backtrace\\*$" :regexp t) popwin:special-display-config))

;; switch window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<C-S-iso-lefttab>")
  (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "<C-S-tab>")
  (lambda () (interactive) (other-window -1)))
(cond (window-system
        (setq x-select-enable-clipboard t)))
