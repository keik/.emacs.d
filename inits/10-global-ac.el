(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20131128.233/dict/")
  (ac-config-default)
  (setq ac-use-fuzzy t)
  (global-auto-complete-mode t)
  (add-hook 'web-mode-hook 'auto-complete-mode)
  (define-key ac-mode-map (kbd "<tab>") 'ac-start)
  (define-key ac-completing-map (kbd "<tab>") 'auto-complete)
  (define-key ac-completing-map (kbd "C-n") 'ac-next)
  (define-key ac-completing-map (kbd "C-p") 'ac-previous)
  (setq ac-auto-show-menu 0)

  ;;; Add ac-sources
  (defun ac-web-mode-setup ()
    (add-to-list 'ac-sources 'ac-source-yasnippet)
    (add-to-list 'ac-sources 'ac-source-filename))
  (add-hook 'web-mode-hook 'ac-web-mode-setup)

  (defun ac-css-mode-setup ()
    (add-to-list 'ac-sources 'add-ac-source-yasnippet)
    (add-to-list 'ac-sources 'ac-source-filename))
  (add-hook 'css-mode-hook 'ac-css-mode-setup)

  (defun ac-js2-mode-setup ()
    (add-to-list 'ac-sources 'ac-source-yasnippet)
    (add-to-list 'ac-sources 'ac-source-filename))
  (add-hook 'js2-mode-hook 'ac-js2-mode-setup)
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
