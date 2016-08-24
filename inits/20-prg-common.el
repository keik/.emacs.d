(unless (require 'editorconfig nil t)
  (package-install 'editorconfig))
(editorconfig-mode)

(unless (require 'git-gutter nil t)
  (package-install 'git-gutter))
(global-git-gutter-mode +1)
(git-gutter:linum-setup)
