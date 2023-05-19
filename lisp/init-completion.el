;;; init-completion.el --- Completion -*- lexical-binding: t -*-
;;

;;; Commentary:
;;
;; Minibuffer and Textcompletion improvements
;;

;;; Code:
;;

;; Searching
(use-package ctrlf
  :init (ctrlf-mode))

;; Vertioc is a minibuffer interface, vertical and better interaction
;; whit the minibuffer
(use-package vertico
  :demand t
  :custom
  (vertico-count 13)                    ; Show max 13 candidates at same time
  (vertico-cycle t)                     ; Go from last to first candidate
  (vertico-resize t)                    ; Do Resize the Minibuffer
  :init
  (vertico-mode)                        ; Enable vertico
  (vertico-reverse-mode))               ; Vertico reversed UI (mainly like Selectrum)

;; Enable rich annotations in minibuffer using the Marginalia package
(use-package marginalia
  :demand t
  :after vertico
  :custom
  (marginalia-align 'right)             ; Alignment of information
  (marginalia-max-relative-age 0)
  :init
  (marginalia-mode))

;; Modify the completionstlye for textcompletions
(use-package orderless
  :custom
  (orderless-matching-styles
   '(orderless-literal                  ; Search is a literal string
     orderless-prefixes                 ; The Search is split at word endings
     orderless-initialism               ; The search Should appear as the beginning of a word
     orderless-regexp                   ; If the component is not a valid regexp, it is ignored.
     orderless-flex                     ; Basically fuzzy finding
     ))
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  )

;;
;; Add and Modify at-point Autocompletion
;;

;; Corfu
(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ; Enable auto completion
  (corfu-auto-prefix 2)          ; Kick in after 2 Chars
  (corfu-auto-delay 0)           ; Go as fast as possible
  (corfu-min-width 60)           ; Set width to 60
  (corfu-max-width corfu-min-width)     ; Make sure its always same width
  (corfu-count 14)                      ; Shown results
  (corfu-scroll-margin 5)               ; Use scroll margin
  ;;(corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
  (tab-always-indent 'complete)       ; Enable completion using tab
  (completion-cycle-threshold nil)    ; Always show all candidates in popup menu

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.
  :init
  (global-corfu-mode))

;; Add backends
(use-package cape
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  ;;(add-to-list 'completion-at-point-functions #'cape-history)
  ;;(add-to-list 'completion-at-point-functions #'cape-keyword)
  ;;(add-to-list 'completion-at-point-functions #'cape-tex)
  ;;(add-to-list 'completion-at-point-functions #'cape-sgml)
  ;;(add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;;(add-to-list 'completion-at-point-functions #'cape-dict)
  ;;(add-to-list 'completion-at-point-functions #'cape-symbol)
  ;;(add-to-list 'completion-at-point-functions #'cape-line)
  )


(provide 'init-completion)
;;; init-completion.el ends here
