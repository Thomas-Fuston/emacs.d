;;; -*- lexical-binding: t; -*-
;;; init-undo.el --- Visual undo
;;

;;; Commentary:
;;
;; Add a visual undo history as a tree
;;

;;; Code:
;;
(use-package undo-tree
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :chords
  (("uu" . undo-tree-visualize))
  :init
  (setq undo-tree-visualizer-timestamps t
        undo-tree-enable-undo-in-region nil
        undo-tree-auto-save-history nil))



(provide 'init-undo)
;;; init-undo.el ends here
