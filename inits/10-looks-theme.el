(unless (require 'cyberpunk-theme nil t)
  (package-install 'cyberpunk-theme))
(load-theme 'cyberpunk t)

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

(set-frame-parameter nil 'alpha '(85 70))
