;;; -*- lexical-binding: t; -*-
;;; init-crux.el --- Add more functionality
;;

;;; Commentary:
;;
;; Adding the Crux package for more functionality and less custom written
;; defuns.
;;

;;; Code:
;;
(use-package crux
  :bind
  ("C-k" . crux-smart-kill-line)
  ("M-o" . crux-smart-open-line)
  ("M-O" . crux-smart-open-line-above)
  ("M-D" . crux-duplicate-current-line-or-region)
  ("C-x C-a" . crux-kill-other-buffers)
  ("C-x C-i" . crux-cleanup-buffer-or-region)
  ("C-x C-k" . crux-delete-file-and-buffer)
  ("C-x C-r" . crux-rename-file-and-buffer)
  )



(provide 'init-crux)
;;; init-crux.el ends here
