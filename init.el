;;; init.el --- Emacs configuration entry point -*- lexical-binding: t; -*-
;;
;; Author: Thomas Fuston
;; URL: https://gitlab.com/ThomasFuston/emacs.d
;;

;;; Commentary:
;;
;; This is the personal Emacs configuration of Thomas Fuston,
;; it is one of many such configuration, but this one is mine.
;;

;;; Code:
;;

;; ---------------------------------------------------------
;; Bootstrap
;; ---------------------------------------------------------

;; Profile emacs startup time and show results
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Put variables set with the built-in customization interface
;; away into a seperate file.
(setq custom-file
      (expand-file-name "etc/custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; Add module folders to the load path
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "defuns/" user-emacs-directory))


;; ----------------------------------------------------------
;; Modules - load settings part by part
;; ----------------------------------------------------------

;; Core
(require 'init-package)    ; Packet management
(require 'init-ui)         ; User interface
(require 'init-base)       ; Baseline Settings

;; Text editing
(require 'init-text)       ; Enhance textmanipulation
(require 'init-crux)       ; More functionality
(require 'init-avy)        ; Improve document navigation
(require 'init-move)       ; Move everything

;; Features
(require 'init-eyebrowse)  ; Adding Workspaces
(require 'init-project)    ; Add Projectmanagement
(require 'init-undo)       ; Visual undotre

;; Coding
(require 'init-parens)     ; Smartly handle parens
(require 'init-indent)     ; Improve indentation
(require 'init-completion) ; Text/Code completion
(require 'init-flycheck)   ; Syntaxchecker
(require 'init-lsp)        ; LSP


;; ----------------------------------------------------------
;; Modules - load settings part by part
;; ----------------------------------------------------------

(require 'defun-goto-line)              ; Improve goto line
(require 'defun-jump-window)            ; Jump Windows forward and backwards


;; ----------------------------------------------------------
;; Specific environments
;; ----------------------------------------------------------

(require 'init-web)                     ; HTML & CSS
(require 'init-js)                      ; Javascript


;; ----------------------------------------------------------
;; After init
;; ----------------------------------------------------------

;; Last but not least - Reset garbage collection and revert
;; the file-name-handler
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 20 1024 1024)
                  gc-cons-percentage 0.1)
            (setq file-name-handler-alist file-name-handler-alist-original)
            (makunbound 'file-name-handler-alist-original)))

;; Make sure Emacs get the right PATH from shell
(exec-path-from-shell-initialize)



(provide 'init)
;;; init.el ends here
