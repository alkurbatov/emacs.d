;; init-ui.el --- Better lookings and appearances. -*- lexical-binding: t -*

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
;; Visual (UI) configurations for better lookings and appearances.
;;

;;; Code:
(require 'init-consts)

(when (display-graphic-p)
  (set-frame-font "JetBrains Mono 14" nil t))

(use-package spaceline
  :demand t

  :init
  (setq powerline-default-separator 'arrow-fade)

  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)

  (spaceline-compile
    ;; Left side.
    '((projectile-root :when active
                       :priority: 85)
      (version-control :when active
                       :priority 78)
      ((flycheck-error flycheck-warning flycheck-info)
       :when active
       :priority 89)
      (buffer-id :priority 98)
      ((point-position
        line-column)
       :priority 96))

    ;; Right side.
    '((python-pyvenv :fallback python-pyenv)
      input-method
      (buffer-encoding :priority 96)
      (major-mode :priority 79)
      (minor-modes :when active
                   :priority 9))))

;; Always show line numbers.
(global-display-line-numbers-mode t)
(setq display-line-numbers "%4d \u2502 ")

(column-number-mode 1) ; always show column number

;; Hide redundand minor modes.
(diminish 'abbrev-mode)
(diminish 'eldoc-mode)
(diminish 'visual-line-mode)

;; Suppress redundand GUI features
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-echo-area-message t)

(provide 'init-ui)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
