(unless (require 'popwin nil t)
  (package-install 'popwin))
(popwin-mode 1)

(push '("^\\*Backtrace\\*$" :regexp t) popwin:special-display-config)
;;(push '("^\\*helm minibuffer-history\\*$" :regexp t) popwin:special-display-config)
