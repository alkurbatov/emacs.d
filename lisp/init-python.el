;; init-python.el --- Initialize Python configurations. -*- lexical-binding: t -*

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
;; Python configuration.
;;

;;; Code:
(defun setup-python-with-lsp ()
  "Setup and enable lsp-mode for Python."
  (poetry-tracking-mode)

  ;; Disable lsp checker in favor of flake8+mypy.
  ;; This should be set before invocation of lsp (lsp-deferred) command.
  (setq-local lsp-diagnostics-provider :none)

  (lsp-deferred)

  (flycheck-add-next-checker 'lsp 'python-flake8)
  (flycheck-add-next-checker 'python-flake8 'python-mypy))

(use-package python
  :ensure nil

  :after tree-sitter

  :config
  (use-package poetry
    :config
    (setq poetry-tracking-strategy 'switch-buffer))

  (use-package lsp-pyright
    :custom
    ;; We use mypy instead.
    (lsp-pyright-typechecking-mode "off"))

  (use-package python-black
    :diminish python-black-on-save-mode)
  (use-package py-isort)

  (setq python-indent-guess-indent-offset-verbose nil)

  :hook
  ((python-mode . setup-python-with-lsp)
   (python-mode . tree-sitter-hl-mode)))

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here
