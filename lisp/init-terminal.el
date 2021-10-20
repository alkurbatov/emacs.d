;; init-terminal.el --- Initialize terminal configurations.

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
;; Terminal configuration.
;;

;;; Code:

(defun open-eshell-at-bottom ()
  "Open eshell in a separate window at the bottom of the screen."
  (interactive)
  (let* ((default-directory (projectile-project-root))
         (height (/ (window-total-height) 3)))
    (split-window-below (- height))
    (other-window 1)
    (eshell)))

(defun open-eshell-at-right-side ()
  "Open eshell in a separate window at the right side of the screen."
  (interactive)
  (let* ((default-directory (projectile-project-root)))
    (split-window-right)
    (other-window 1)
    (eshell)))

(use-package eshell
  :ensure nil

  :after projectile

  :bind
  (("C-x -" . open-eshell-at-bottom)
   ("C-x |" . open-eshell-at-right-side)))

(provide 'init-terminal)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-terminal.el ends here
