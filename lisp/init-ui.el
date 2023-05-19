;;; init-ui.el --- User interface settings -*- lexical-binding: t; -*-
;;

;;; Commentary:
;;
;; Lets do improve the look and feel of Emacs and make it a
;; cozy place to be.
;;

;;; Code:
;;

;; Set a more useful titlebar including path to open file.
(setq frame-title-format
      '("Emacs  - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Disable Gnu Splashscreen and *scratch*-buffer message.
(setq inhibit-startup-message t
      initial-scratch-message nil)

;; Improve Scrolling in larger files
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
        mouse-wheel-progressive-speed nil))

(setq auto-window-vscroll nil
      scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000)

;; Always show current key-sequence in minibuffer.
(setq echo-keystrokes 0.02)

;; Always show current line and column of Cursor.
(setq-default line-number-mode t
              column-number-mode t)

;; Highlight the current cursor line but only in the active buffer.
;; (setq hl-line-sticky-flag nil
;;       global-hl-line-sticky-flag nil)
;; (global-hl-line-mode)

;; Highlight matching delimiters
(show-paren-mode)
(setq show-paren-delay 0.1
      show-paren-highlight-openparen t
      show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

;; Use 'y' or 'n' instead of 'yes' or 'no'.
(defalias 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'y-or-n-p)

;; Disable Cursor blink
(setq blink-cursor-mode nil)

;; Supress some GUI features if possible.
(setq use-file-dialog nil
      use-dialog-box nil)
(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))
(when (eq system-type 'gnu/linux)
  (setq x-gtk-use-system-tooltips nil))

;; Set the font face based on platform
(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :weight 'light
                    :height 105)

;; Set the fixed pitch fasce
(set-face-attribute 'fixed-pitch nil
                    :font "JetBrains Mono"
                    :weight 'light
                    :height 100)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil
                    :font "Iosevka Aile"
                    :height 100
                    :weight 'light)

;; Let add Colors for light and dark themes
(use-package spacemacs-theme
  :bind
  ("C-x t d" . dark-theme)
  ("C-x t l" . light-theme)
  :init
  (defun light-theme ()
    "Activate light colortheme"
    (interactive)
    (load-theme 'spacemacs-light)
    (spaceline-compile))

  (defun dark-theme ()
    "Activate dark colortheme"
    (interactive)
    (load-theme 'spacemacs-dark)
    (spaceline-compile))

  ;; Load theme
  (load-theme 'spacemacs-dark))

;; Get a fancier Modeline with more information
(use-package spaceline
  :demand t
  :custom
  (powerline-height 20)
  (powerline-default-separator 'slant)
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))



;; Add diminish
(use-package diminish :demand t)



(provide 'init-ui)
;;; init-ui.el ends here
