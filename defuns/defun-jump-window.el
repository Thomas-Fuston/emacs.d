;;; -*- lexical-binding: t; -*-
;;; defun-jump-window.el --- add function
;;

;;; Commentary:
;;
;; While Emacs have a function to jump to the next window, lets
;; add a function to jump backwards.

;;; Code:
;;
(use-package jump-window
  :ensure nil
  :bind
  ("M-j" . other-window)
  ("M-J" . other-window-back)
  :init
  (defun other-window-back ()
    "Move the cursor to the previous window."
    (interactive)
    (other-window -1))

  (provide 'jump-window))



(provide 'defun-jump-window)
;;; defun-jump-window.el ends here
