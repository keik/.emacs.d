(unless (require 'auto-complete nil t)
  (package-install 'auto-complete))

(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-fuzzy t)
(global-auto-complete-mode t)
(define-key ac-mode-map (kbd "<tab>") 'ac-start)
(define-key ac-completing-map (kbd "<tab>") 'auto-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(setq ac-auto-show-menu 0)

;; Add ac-sources
(defun ac-web-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-filename))
(add-hook 'web-mode-hook 'ac-web-mode-setup)

(defun ac-css-mode-setup ()
  (add-to-list 'ac-sources 'add-ac-source-yasnippet)
  (add-to-list 'ac-sources 'ac-source-filename))
(add-hook 'css-mode-hook 'ac-css-mode-setup)

(defun ac-coffee-mode-setup ()
  (add-to-list 'ac-sources 'ac-source-filename))
(add-hook 'coffee-mode-hook 'ac-coffee-mode-setup)
