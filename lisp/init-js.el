;; init-js.el --- Initialize JavaScript configurations. -*- lexical-binding: t -*

;; Copyright (c) 2021-2022 Alexander Kurbatov
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
;; JavaScript configuration.
;;

;;; Code:
(use-package add-node-modules-path)

(use-package json-mode
  :init
  (setq-default indent-tabs-mode nil)

  :config
  (setq js-indent-level 2))

(use-package js2-mode
  :after (flycheck add-node-modules-path)

  :mode "\\.js\\'"
  :interpreter "node"

  :init
  (setq-default indent-tabs-mode nil)

  :config
  (use-package prettier
    :diminish)

  ;; Setup flycheck.
  ;; Do C-c ! s for manual selection of a checker.
  (setq flycheck-checker 'javascript-eslint)

  :hook
  (js2-mode . add-node-modules-path)

  :custom
  (js-indent-level 2)

  ;; Disable js2-mode embedded checker in favor of flycheck.
  (js2-mode-show-parse-errors nil)
  (js2-mode-show-strict-warnings nil))

(provide 'init-js)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-js.el ends here
