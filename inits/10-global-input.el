(set-language-environment "japanese")

(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; redo+
(require 'redo+ nil 'noerror)
(setq undo-no-redo t)
(define-key global-map (kbd "C-?") 'redo)
(define-key global-map (kbd "C-M-_") 'redo)
