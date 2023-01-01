;; init-flycheck.el --- Initialize flycheck configurations. -*- lexical-binding: t -*

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
;; Flycheck configurations.
;;

;;; Code:
(require 'init-private)

(defun alk/flycheck-checker-get (fn checker property)
  (or (alist-get property (alist-get checker alk-pvt/flycheck-local-cache))
      (funcall fn checker property)))

(use-package flycheck
  :diminish

  :demand t

  :config
  ;; Force additional checkers launched after lsp mode if needed.
  ;; See https://github.com/flycheck/flycheck/issues/1762
  (advice-add 'flycheck-checker-get :around 'alk/flycheck-checker-get)

  ;; Hide indicatiors in left-fringe (gui mode).
  (setq flycheck-indication-mode nil)

  :hook
  (after-init . global-flycheck-mode))

(provide 'init-flycheck)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-flycheck.el ends here
