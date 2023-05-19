;;; init-package.el --- Emacs package management -*- lexical-binding: t; -*-
;;

;;; Commentary:
;;
;; Setting up `use-package' for clean package management and add package
;; repositories, to Install packages from.
;;

;;; Code:
;;

;; Adding Package repositories
(require 'package)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Prioritize repositories when getting new packages.
(customize-set-variable 'package-archive-priorities
                        '(("gnu"    . 99) ; 1
                          ("nongnu" . 80) ; 2
                          ("melpa"  . 0))) ; 3

;; Check if `use-package' is already installed if not
;; install it now.
(unless (package-installed-p 'use-package)
  (progn
    (package-refresh-contents)
    (package-install 'use-package)))
(require 'use-package)

;; Tell `use-package' to always load lazily unless told otherwise.
;; If `:demand' is set, the loading is eager.
(setq use-package-always-defer t)

;; Always ensure installation of packages without the need
;; of the `:ensure' keyword.
(setq use-package-always-ensure t)

;; Add some more syntactic sugar to `use-package' for keybindings
(use-package bind-key :demand t)

;; Add macro for fast keybindings to `use-package'
(use-package use-package-chords
  :demand t
  :config (key-chord-mode 1))

;; Add Hydra keybinding tool for later
(use-package hydra :demand t)

;; Check for Updates and update regulary
(use-package auto-package-update
  :if (not (daemonp))
  :custom
  (auto-package-update-interval 7) ;; in days
  (auto-package-update-prompt-before-update t)
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t)
  :config
  (auto-package-update-maybe))



(provide 'init-package)
;;; init-package.el ends here
