;; init-theme.el --- Initialize theme configurations. -*- lexical-binding: t -*

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
;; Theme configuration.
;;

;;; Code:
(use-package doom-themes
  :demand t

  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  :config
  (load-theme 'doom-nord t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  :hook
  (yaml-mode . (lambda()
                 (face-remap-add-relative 'font-lock-variable-name-face :foreground "#fec66c")))

  :custom-face
  (flycheck-error ((t (:background "red" :foreground "white" :underline nil))))
  (flycheck-warning ((t (:background "orange" :foreground "black" :underline nil))))

  (git-gutter:added ((t (:foreground "lime green"))))
  (git-gutter:deleted ((t (:foreground "red"))))
  (git-gutter:modified ((t (:foreground "orange"))))

  (ethan-wspace-face ((t (:foreground "unspecified" :background "orange"))))

  (calendar-iso-week-face ((t (:height 1.0 :foreground "dark cyan")))))

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("NB"         success bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))


(provide 'init-theme)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-theme.el ends here
