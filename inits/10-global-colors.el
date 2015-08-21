;; theme
(load-theme 'wombat)
(set-frame-parameter (selected-frame) 'alpha '(85 70))

(custom-set-faces
  '(default ((t (:background "black"))))
  '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue")))))
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
