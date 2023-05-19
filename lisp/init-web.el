;;; init-web.el --- Webtemplates -*- lexical-binding: t -*-
;;

;;; Commentary:
;;
;; Setup everything for Webtemplates editing.
;;

;;; Code:
;;

(use-package web-mode
  :mode ("\\.html?\\'" "\\.pt?\\'" "\\.svelte\\'" "\\.css\\'")
  :custom
  (css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-indent-style 2))

;; Handle pug templates
(use-package pug-mode)
;; SASS support
(use-package sass-mode)
;; SCSS support
(use-package scss-mode
  :init (setq-default scss-compile-at-save nil))
;; LESS support
(use-package less-css-mode)
;; YAML support
(use-package yaml-mode)

;; Simple server
(use-package simple-httpd)

;; Emmet mode
(use-package emmet-mode
  :diminish t
  :hook (web-mode . emmet-mode)
  :custom
  (emmet-move-cursor-between-quotes t))



(provide 'init-web)
;;; init-web.el ends here
