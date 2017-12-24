(unless (require 'cyberpunk-theme nil t)
  (package-install 'cyberpunk-theme))
(load-theme 'cyberpunk t)

(set-face-attribute 'mode-line nil
  :height 120
  :foreground "#88CCFF"
  :background "#555555"
  :box '(:line-width 1 :color "#88CCFF"))
(set-face-attribute 'mode-line-inactive nil
  :height 120
  :foreground "#777777"
  :background "#555555"
  :box '(:line-width 1 :color "#333333"))
(set-face-attribute 'mode-line-buffer-id nil
  :foreground "#DDDDDD")

(set-frame-parameter nil 'alpha '(85 70))
