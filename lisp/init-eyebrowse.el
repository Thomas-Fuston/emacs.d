;;; -*- lexical-binding: t; -*-
;;; init-eyebrowse.el --- Workspaces
;;

;;; Commentary:
;;
;; Set up tmux like Workspaces for Emacs.
;;

;;; Code:
;;
(use-package eyebrowse
  :demand t
  :diminish eyebrowse-mode
  :bind
  ("C-c 1" . eyebrowse-switch-to-window-config-1)
  ("C-c 2" . eyebrowse-switch-to-window-config-2)
  ("C-c 3" . eyebrowse-switch-to-window-config-3)
  ("C-c 4" . eyebrowse-switch-to-window-config-4)
  ("C-c q" . eyebrowse-close-window-config)
  :config
  (eyebrowse-mode t))



(provide 'init-eyebrowse)
;;; init-eyebrowse.el ends here
