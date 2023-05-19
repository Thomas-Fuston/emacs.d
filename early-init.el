;;; -*- lexical-binding: t; -*-
;;; early-init.el
;;
;; Author: Thomas Fuston
;; URL: https://gitlab.com/ThomasFuston/emacs.d
;;

;;; Commentary:
;;
;; This is the early-init file of the personal emacs config
;; from Thomas Fuston, it will be run before init.el when
;; emacs is loaded.
;;

;;; Code:
;;

;; Disable package initialization at start
(setq package-enable-at-startup nil)

;; Increase the GC threshold for a faster startup
;; and increasing the allocation for Heap.
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Unset file-name-handler
(defvar file-name-handler-alist-original file-name-handler-alist)
(setq file-name-handler-alist nil)

;; Remove all the clutter from the interface which is not needed
;; from the get go.
(dolist (mode '(tool-bar-mode
                scroll-bar-mode
                horizontal-scroll-bar-mode
                menu-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))



(provide 'early-init)
;;; early-init.el ends here
