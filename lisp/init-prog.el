;; init-prog.el --- Initialize common programming configurations. -*- lexical-binding: t -*

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
;; Common programming configuration.
;;

;;; Code:
(use-package company
  :diminish

  :demand t

  :init
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 1)

  :hook (after-init . global-company-mode)

  :bind
  (:map
   company-active-map
   ("C-n" . company-select-next)
   ("C-p" . company-select-previous)))

(use-package lsp-mode
  :diminish

  :custom
  (lsp-auto-guess-root +1)

  :config
  ;; Manually inject flycheck support as by some reason it is not enabled by default.
  (require 'lsp-diagnostics)
  (lsp-diagnostics-flycheck-enable)

  ;; Refresh lenses faster.
  (setq lsp-idle-delay 0.1)

  ;; Disable flymake in favor of flycheck.
  (setq lsp-prefer-flymake nil)

  (if (not (display-graphic-p))
    (setq lsp-headerline-breadcrumb-icons-enable nil))

  ;; See this guide for meaning of this section and additional features to disable:
  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  (setq lsp-modeline-code-actions-enable nil)

  (use-package lsp-ivy
    :commands lsp-ivy-workspace-symbol)

  (use-package lsp-ui
    :commands lsp-ui-mode)

  (lsp-register-client
   (make-lsp-client
    :new-connection
    (lsp-tramp-connection
     (lambda () (cons "/usr/bin/clangd" lsp-clients-clangd-args)))
    :major-modes '(c++-mode)
    :remote? t
    :server-id 'clangd-remote))

  :commands
  (lsp lsp-deferred))

(use-package tree-sitter
  :diminish

  :demand t

  :config
  (use-package tree-sitter-langs)

  (global-tree-sitter-mode))

(provide 'init-prog)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-prog.el ends here
