(unless (require 'editorconfig nil t)
  (package-install 'editorconfig))
(editorconfig-mode)
