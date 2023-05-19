;;; init-lsp.el --- LSP -*- lexical-binding: t -*-


;;; Commentary:
;;
;; Setup Language server protocoll
;;

;;; Code:
;;

(use-package lsp-mode
  :demand t
  :hook (web-mode . lsp-mode)
  :custom
  (lsp-headerline-breadcrumb-enable nil))



(provide 'init-lsp)
;;; init-lsp.el ends here
