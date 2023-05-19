;;; -*- lexical-binding: t; -*-
;;; init-text.el --- Textmanipulation
;;

;;; Commentary:
;;
;; Enhance textmanipulation functionality.
;;

;;; Code:
;;

;; Expand region based on logical semantic units
(use-package expand-region
  :bind ("M-i" . er/expand-region))

;; Multiple cursors are awesome
(use-package multiple-cursors
  :bind ; Keybindings
  ("M-m" . mc/mark-next-like-this)
  ("M-M" . mc/mark-previous-like-this))



(provide 'init-text)
;;; init-text.el ends here
