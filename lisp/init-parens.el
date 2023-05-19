;;; -*- lexical-binding: t; -*-
;;; init-parens.el --- Parens
;;

;;; Commentary:
;;
;;  Smartly handle parens
;;

;;; Code:
;;
(use-package smartparens
  :demand t
  :hook (prog-mode . smartparens-mode)
  :diminish
  :config
  (require 'smartparens-config)
  (smartparens-global-mode +1)
  (show-smartparens-global-mode +1)
  ;; Stop pairing single quotes in elisp
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil))



(provide 'init-parens)
;;; init-parens.el ends here
