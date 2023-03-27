;; init-org.el --- Initialize Org mode configurations. -*- lexical-binding: t -*

;; Copyright (c) 2021-2023 Alexander Kurbatov
;;
;; Author: Alexander.Kurbatov <sandro.kurbatov@gmail.com>
;; URL: https://github.com/alkurbatov/emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;

;;; Commentary:
;;
;; Org mode configuration.
;;

;;; Code:
(require 'init-custom)

(defun org-insert-todo-item ()
  "Insert TODO heading with 'created' timestamp."
  (interactive)
  (org-insert-todo-heading-respect-content nil)
  (save-excursion
    (newline-and-indent)
    (insert (format-time-string "[%Y-%m-%d]")))
  (insert " "))

(defun alk/org-time-stamp-inactive ()
  "Insert inactive timestamp with current date."
  (interactive)
  (org-insert-time-stamp (current-time) nil t))

(use-package org
  :ensure nil

  :config
  ;; Small speedup, we don't need the agenda after every start.
  (setq org-agenda-inhibit-startup t)

  ;; Load org files with tasks.
  (setq org-agenda-files `(,alk/org-directory))
  (nconc org-agenda-files (directory-files-recursively alk/org-projects "\\.org$"))

  ;; Hide the emphasis markup (italics, bold, etc).
  (setq org-hide-emphasis-markers t)

  ;; Return or left-click with mouse follows link.
  (customize-set-variable 'org-return-follows-link t)
  (customize-set-variable 'org-mouse-1-follows-link t)

  ;; Show nice-looking symbols instead of asterisks.
  (use-package org-superstar
    :init
    (setq org-superstar-headline-bullets-list '("❯" "❯❯" "❯❯❯" "❯❯❯❯" "❯❯❯❯❯"))

    :config
    ;; Hide leading dots.
    (setq org-superstar-leading-bullet ?\s
          org-superstar-leading-fallback ?\s
          org-hide-leading-stars nil)

    :hook (org-mode . org-superstar-mode))

  ;; Enable nice indent.
  (use-package org-indent
    :ensure nil

    :diminish

    :hook
    (org-mode . org-indent-mode))

  ;; Add current time when marking item as 'done'.
  (setq org-log-done 'time)

  (setq org-todo-keywords
      '((sequence "TODO" "|" "DONE" "CANCELLED")))

  ;; Better source code highlighting.
  (setq org-confirm-babel-evaluate nil
        org-src-fontify-natively t
        org-src-tab-acts-natively t)

  ;; Languages support for code blocks.
  (defvar load-language-list '((emacs-lisp . t)
                               (js . t)
                               (python . t)
                               (shell . t)))
  (org-babel-do-load-languages 'org-babel-load-languages
                               load-language-list)

  ;; Ask ispell to ignore org content blocks.
  (add-to-list 'ispell-skip-region-alist '(":PROPERTIES:" . ":END:"))
  (add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
  (add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_EXAMPLE" . "#\\+END_EXAMPLE"))

  ;; Customize some links, see:
  ;; https://kitchingroup.cheme.cmu.edu/blog/2016/11/04/New-link-features-in-org-9/

  ;; "Green" projects aka moving me to personal targets.
  (org-link-set-parameters
    "green-project"
    :face '(:foreground "green" :underline t)
    :follow (lambda (path) (org-open-file path)))

  ;; "Red" projects aka must-do-or-be-fired.
  (org-link-set-parameters
    "red-project"
    :face '(:foreground "firebrick2" :underline t)
    :follow (lambda (path) (org-open-file path)))

  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c i" . alk/org-time-stamp-inactive)
   ("C-c l" . org-store-link)
   ("C-c C-x t" . org-insert-todo-item)
   ("C-c z" . org-toggle-link-display)))

(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
