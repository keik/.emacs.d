(unless (require 'magit nil t)
  (package-install 'magit))

(setq magit-blame-heading-format "%.7H %-20a %C %s")
