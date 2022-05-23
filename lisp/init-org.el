;; init-org.el --- Initialize Org mode configurations. -*- lexical-binding: t -*

;; Copyright (c) 2021 Alexander Kurbatov
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
  "Insert TODO heading with 'created' timestamp as property."
  (interactive)
  (org-insert-todo-heading-respect-content nil)
  (org-entry-put nil "CREATED" (format-time-string "[%Y-%m-%d]")))

(use-package org
  :ensure nil

  :config
  ;; Load org files with tasks.
  (setq org-agenda-files `(,alk/org-directory))
  (nconc org-agenda-files (directory-files-recursively alk/org-projects "\\.org$"))

  ;; Show nice-looking symbols instead of asterisks.
  (use-package org-superstar
    :hook (org-mode . org-superstar-mode))

  ;; Add current time when marking item as 'done'.
  (setq org-log-done 'time)

  ;; Languages support for code blocks.
  (defvar load-language-list '((emacs-lisp . t)
                               (js . t)
                               (python . t)
                               (shell . t)))
  (org-babel-do-load-languages 'org-babel-load-languages
                               load-language-list)

  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c l" . org-store-link)
   ("C-c C-x t" . org-insert-todo-item)))

(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
