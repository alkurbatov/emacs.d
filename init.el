;; init.el --- Main initialisation routine. -*- lexical-binding: t -*

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
;; A Fancy Emacs Configuration.
;;

;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Packages.
(require 'init-package)

;; Move Custom-Set-Variables to Different File, otherwise init.el will be used.
(setq custom-file "~/.emacs.d/custom-set-variables.el")
(load custom-file 'noerror)

;; General settings.
(require 'init-basic)
(require 'init-edit)
(require 'init-helm)
(require 'init-treeview)
(require 'init-ui)

;; Programming.
(require 'init-flycheck)
(require 'init-git)
(require 'init-help)
(require 'init-lisp)
(require 'init-projectile)
(require 'init-yasnippet)
(require 'init-terminal)

;; Languages.
(require 'init-bash)
(require 'init-c++)
(require 'init-jinja2)
(require 'init-js)
(require 'init-markdown)
(require 'init-ps1)
(require 'init-python)
(require 'init-r)
(require 'init-vue)
(require 'init-yaml)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
