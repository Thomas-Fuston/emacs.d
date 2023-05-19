;;; -*- lexical-binding: t -*-
;;; init-js.el --- Javascript editing.
;;

;;; Commentary:
;;
;; Setup for Javascript editing
;;

;;; Code:
;;


(use-package js2-mode
  :bind
  (:map js2-mode-map
        ("M-." . nil)
        ("M-j" . nil))
  :init
  (setq js-indent-level 2)
  (setq js2-strict-missing-semi-warning nil)
  :config
  ;; Activate JS2-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; Add JS REPL
  (use-package js-comint
    :init
    (setq exec-path (append exec-path '(".nvm/versions/node/v18.12.1/bin")))
    (setq inferior-js-programm-command "node --interactive")))

;; Add Prettier support
(use-package prettier
  :diminish t
  :hook ((web-mode . prettier-mode)
         (js2-mode . prettier-mode)))



(provide 'init-js)
;;; init-js.el ends here
