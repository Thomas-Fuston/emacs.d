;;; -*- lexical-binding: t; -*-
;;; init-move.el --- Move everything
;;

;;; Commentary:
;;
;; Add function to move Lines, Regions and Buffers around.
;;

;;; Code:
;;

;; Move lines and Regions
(use-package move-dup
  :diminish
  :hook (after-init . global-move-dup-mode)
  :bind
  ("M-<up>" . md/move-lines-up)
  ("M-<down>" . md/move-lines-down))

;; Move buffers around
(use-package buffer-move
  :demand t
  :bind
  ("<C-M-up>" . buf-move-up)
  ("<C-M-down>" . buf-move-down)
  ("<C-M-left>" . buf-move-left)
  ("<C-M-right>" . buf-move-right))



(provide 'init-move)
;;; init-move.el ends here
