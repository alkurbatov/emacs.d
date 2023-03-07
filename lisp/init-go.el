;; init-go.el --- Initialize Go configurations. -*- lexical-binding: t -*

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
;; Go configuration.
;;

(require 'init-custom)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun setup-go-with-lsp ()
  "Setup and enable lsp-mode for Go."
  (lsp-deferred)

  ;; Disable go-build checker to suppress annoying warning
  ;; when standalone (i.e. without go.mod) go files are opened.
  (setq flycheck-disabled-checkers '(go-build))

  (flycheck-add-next-checker 'lsp 'golangci-lint)

  ;; Enable code formatting on save.
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

;;; Code:
(use-package go-mode
  :after tree-sitter

  :config
  (use-package flycheck-golangci-lint
    :config
    (setq flycheck-golangci-lint-tests t)
    (setq flycheck-golangci-lint-fast t))

  ;; By some reason this is not in the path
  ;; when we run in GUI mode on OS X.
  (when (display-graphic-p)
    (setq godef-command (concat alk/gobin "/godef")))

  :bind
  ("M-." . godoc-at-point)

  :hook
  ((go-mode . tree-sitter-hl-mode)
   (go-mode . setup-go-with-lsp)
   (go-mode . flycheck-golangci-lint-setup)
   ;; Enable syntax highlight in godoc buffer.
   (godoc-mode . go-mode)))

;; Local Golang playground for short snippets.
(use-package go-playground
  :diminish

  :commands go-playground-mode

  :config
  (setq go-playground-basedir "~/work/sandbox"))

(provide 'init-go)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-go.el ends here
