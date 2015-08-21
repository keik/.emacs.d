;; load packages
(package-initialize)

;; run as server
(require 'server)
(unless (server-running-p)
  (server-start))

;; disable uselessies
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; load inits
(require 'init-loader)
(init-loader-load)
