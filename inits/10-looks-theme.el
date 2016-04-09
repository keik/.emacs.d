(unless (require 'zenburn nil t)
  (package-install 'zenburn-theme))
(load-theme 'zenburn t)
(unless (require 'cyberpunk-theme nil t)
  (package-install 'cyberpunk-theme))
(load-theme 'zenburn t)
(set-face-background 'region "#224499")
;;(load-theme 'cyberpunk t)

(set-face-attribute 'mode-line nil
  :height 120
  :foreground "#88CCFF"
  :background "#222222"
  :box '(:line-width 3 :color "#222222"))
(set-face-attribute 'mode-line-inactive nil
  :height 120
  :foreground "#555555"
  :background "#333333"
  :box '(:line-width 3 :color "#333333"))
(set-face-attribute 'mode-line-buffer-id nil
  :foreground "#DDDDDD")
(set-face-attribute 'minibuffer-prompt nil
  :background "#3F3F3F")
(set-face-attribute 'show-paren-match-face nil
  :foreground "#CCCCCC"
  :background "#6699CC")
(set-face-attribute 'helm-selection nil
  :background "#224499")
(set-frame-parameter nil 'alpha '(85 70))
