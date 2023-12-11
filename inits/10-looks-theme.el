;;; 10-looks-theme.el --- settings for theme
;;; Commentary:
;;; Code:
(unless (require 'cyberpunk-theme nil t)
  (package-install 'cyberpunk-theme))
 (load-theme 'cyberpunk t)
(set-face-background 'default "unspecified-bg")
(set-face-foreground 'font-lock-comment-face "#CCCCCC")
;;; 10-looks-theme.el ends here
