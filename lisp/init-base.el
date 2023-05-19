;;; init-base.el --- Emacs baseline settings -*- lexical-binding: t; -*-
;;

;;; Commentary:
;;
;; Change the default Emacs settings to my likings.
;;

;;; Code:
;;

;; Lets use UTF-8 everywhere!
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
;; Also in Windows
(unless (memq system-type '(cygwin windows-nt ms-dos))
  (setq selection-coding-system 'utf-8))

;; Disable all Backups, Just use vcs.
(setq create-lockfiles nil
      make-backup-files nil
      auto-save-default nil)

;; Each line is 80 chars wide
(setq-default fill-column 80)

;; Don't let Emacs brake your lines
(setq-default truncate-lines t)

;; Make sentences end with one space only
(setq sentence-end-double-space nil)

;; Continue wrapped words at whitespace, rather than in the middle of a word.
(setq-default word-wrap t)

;; Lets stay POSIX conform and add a line at the end
(setq require-final-newline t)

;; Use space over tab. One tab will be 2 spaces.
(setq-default indent-tabs-mode nil
              tab-width 2)

;; Listen to outside changes of files and folders.
;; But be silent about it.
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)
(global-auto-revert-mode 1)

;; When open a file straight jump to the last location.
(setq save-place-file
      (expand-file-name "etc/places" user-emacs-directory))
(save-place-mode 1)

;; Remember recent used files
(require 'recentf)
(setq recentf-max-saved-items 50
      recentf-save-file
      (expand-file-name "etc/recentf" user-emacs-directory))

;; Remeber recent used commands.
(require 'savehist)
(setq history-length 150
      savehist-file (expand-file-name "etc/savehist" user-emacs-directory))
(savehist-mode t)

;; Delete region with new typed text
(delete-selection-mode 1)

;; Enable subword mode
(global-subword-mode 1)
(add-hook 'c-mode-common-hook
          (lambda () (subword-mode 1)))

;; Disable the annyoing bell!
(setq ring-bell-function 'ignore)

;; Enable external-bound copy-pasting
(setq select-enable-clipboard t)
(setq save-interprogram-paste-before-kill t)

;; Remove trailing whitespace automagically on saving.
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))

;; Remap some default keys for more comfort
(use-package bind-key
  :ensure nil
  :bind
  ("M-u" . undo)
  ("M-p" . scroll-down)
  ("M-n" . scroll-up)
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease))



(provide 'init-base)
;;; init-base.el ends here
