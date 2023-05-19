;;; -*- lexical-binding: t; -*-
;;; init-flycheck.el --- Syntaxchecking
;;

;;; Commentary:
;;
;; Setup Syntaxchecking
;;

;;; Code:
;;


(use-package flycheck
  :config
  ;; disable jshint since i do prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))

  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  :init
  (global-flycheck-mode))



(provide 'init-flycheck)
;;; init-flycheck.el ends here
