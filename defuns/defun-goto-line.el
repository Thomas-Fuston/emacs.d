;;; -*- lexical-binding: t; -*-
;;; defun-goto-line - improve function
;;

;;; Commentary:
;;
;; Add a improved version of the goto-line function
;;

;;; Code:
;;
(use-package goto-line
  :ensure nil
  :bind
  ("M-g " . goto-line-improved)
  :init
  (defun goto-line-improved ()
    "Show line numbers temporarily, while prompting for a line number."
    (interactive)
    (unwind-protect
        (progn
          (display-line-numbers-mode 1)
          (goto-line (read-number "Goto line: ")))
      (display-line-numbers-mode -1)))
  (provide 'goto-line))



(provide 'defun-goto-line)
;;; defun-goto-line.el ends here
