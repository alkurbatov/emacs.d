;; init-edit.el --- Initialize editing configurations. -*- lexical-binding: t -*

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
;; Editing configurations.
;;

;;; Code:

;; Spellcheck.
(setq ispell-program-name "aspell")
(setq ispell-dictionary "american")

;; Trim trailing whitespaces on changed lines.
(use-package ws-butler
  :diminish

  :init
  (setq-default show-trailing-whitespace t)

  :hook
  ((prog-mode . ws-butler-mode)
   (org-mode . ws-butler-mode))) ; do not enable in text-mode to avoid trimming in markdown files


(use-package avy
  :bind
  (("M-g c" . avy-goto-char-in-line)
   ("M-g w" . avy-goto-word-1)))

(global-set-key (kbd "C-x O")
                (lambda ()
                  (interactive)
                  (other-window -1)))

;; Join line to next line.
(global-set-key (kbd "C-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Join line to previous line.
(global-set-key (kbd "M-j") 'join-line)

;; Undo without necessity to press Shift.
(global-set-key (kbd "C--") 'undo)

(defun insert-date ()
  "Insert current date into the buffer."
  (interactive)
  (insert (format-time-string "%d-%m-%Y")))

(provide 'init-edit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
