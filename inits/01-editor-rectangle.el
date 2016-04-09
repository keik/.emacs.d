(cua-mode t)
(setq cua-enable-cua-keys nil)
(setq cua-mode-enable-cua-keys nil)
(define-key global-map (kbd "M-RET") 'cua-rectangle-mark-mode)
