;; init-makefile.el --- Initialize Makefile configurations. -*- lexical-binding: t -*

;; Copyright (c) 2022-2023 Alexander Kurbatov
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
;; Makefile configuration.
;;

;;; Code:

(use-package makefile-mode
  :ensure nil

  :init
  (setq-default indent-tabs-mode t)

  ;; Don't highlight long lines, there is not much we can do with them.
  (setq whitespace-line-column nil)

  ;; Use better tab symbol.
  (setq whitespace-display-mappings '((tab-mark ?\t [?› ?\t])))

  ;; Show only tabs.
  (setq whitespace-style '(tabs tab-mark))

  :hook
  (makefile-mode . whitespace-mode))

(provide 'init-makefile)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-makefile.el ends here
