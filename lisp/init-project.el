;;; -*- lexical-binding: t; -*-
;;; init-project.el --- Project management
;;

;;; Commentary:
;;
;; Add Projectmanagement functionality.
;;

;;; Code:
;;
(use-package projectile
  :diminish t
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-mode-line-prefix ""
        projectile-sort-order 'recentf
        projectile-use-git-grep t)
  ;; Keychord Keybinding
  (key-chord-define-global "jj" 'hydra-projects/body)
  :config
  ;; Use Selectrum instead of IDO
  (setq projectile-completion-system 'default)
  ;; Hydra keybindings
  (defhydra hydra-projects (:color blue)
    "Project"
    ("f" projectile-find-file "file")
    ("d" projectile-find-dir "directory")
    ("b" projectile-switch-to-buffer "buffer")
    ("c" projectile-ag "code")
    ("s" projectile-switch-project "project")))



(provide 'init-project)
;;; init-project.el ends here
