;; init-vue.el --- Initialize VueJS configurations. -*- lexical-binding: t -*

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
;; VueJS configuration.
;; vue-mode uses the original js-mode, because
;; js2-mode doesn't work well with mmm-mode.
;;

;;; Code:

(use-package vue-mode
  :after flycheck

  :init
  (setq-default indent-tabs-mode nil)

  :config
  (use-package add-node-modules-path)
  (add-node-modules-path)

  :custom
  (setq js-indent-level 2)
  (setq vue-html-tab-width 2)
  (setq css-indent-offset 2)

  (flycheck-add-mode 'javascript-eslint 'vue-mode) ; enable linter

  :custom-face
  (mmm-default-submode-face ((t (:background nil)))))

(provide 'init-vue)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-vue.el ends here
