(global-whitespace-mode)

(setq whitespace-style '(face
                          tabs
                          trailing
                          tab-mark
                          spaces
                          space-mark))

(setq whitespace-display-mappings
  '((space-mark ?\u3000 [?\u25a1])
     (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
;; (tab-mark   ?\t	  [?\xBB ?\t])
(setq whitespace-space-regexp "\\(\u3000+\\)")

(set-face-foreground 'whitespace-tab "#666666")
(set-face-background 'whitespace-tab nil)
(set-face-underline  'whitespace-tab nil)

(set-face-foreground 'whitespace-space nil)
(set-face-background 'whitespace-space nil)
(set-face-underline  'whitespace-space nil)

(set-face-foreground 'whitespace-trailing nil)
(set-face-background 'whitespace-trailing "#666666")
(set-face-underline  'whitespace-trailing nil)
