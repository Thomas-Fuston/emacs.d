;;; -*- lexical-binding: t; -*-
;;; init-indent.el --- Indentation
;;

;;; Commentary:
;;
;; Better handle and visualize indentations
;;

;;; Code:
;;

;; Keep everything always indent
(use-package aggressive-indent
  :demand t
  :diminish
  :hook (after-init . global-aggressive-indent-mode))

;; highlight indentations
(use-package highlight-indent-guides
  :demand t
  :if (display-graphic-p)
  :diminish
  ;; Enable manually if needed, it a severe bug which potentially core-dumps Emacs
  ;; https://github.com/DarthFennec/highlight-indent-guides/issues/76
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indent-guides-responsive 'top)
  (highlight-indent-guides-delay 0)
  (highlight-indent-guides-auto-character-face-perc 7))



(provide 'init-indent)
;;; init-indent.el ends here
