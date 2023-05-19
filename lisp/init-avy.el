;;; -*- lexical-binding: t -*-
;;; init-avy.el --- Navigation
;;

;;; Commentary:
;;
;; Use avy to move lightning fast to the right position within a document.
;;

;;; Code:
;;

(use-package avy
  :demand t
  :chords
  (("jl" . avy-goto-line)
   ("jk" . avy-goto-char))
  :init
  (setq avy-all-windows nil
        avy-all-windows-alt t))



(provide 'init-avy)
;;; init-avy.el ends here
