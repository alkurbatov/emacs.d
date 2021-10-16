;; init-c++.el --- Initialize C++ configurations.

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
;; C/C++ configuration.
;;

;;; Code:

(use-package cc-mode
  :ensure nil

  :after flycheck

  :init
  (setq-default indent-tabs-mode nil)

  :config
  ;; Setup flycheck.
  ;; Do C-c ! s for manual selection of a checker.
  ;; Do C-c ! v to verify which checkers used and in which order.
  (add-to-list 'flycheck-checkers 'c/c++-clang)
  (add-to-list 'flycheck-checkers 'c/c++-gcc)
  (add-to-list 'flycheck-checkers 'c/c++-cppcheck)

  ;; Default include paths.
  (setq flycheck-clang-include-path (list "/opt/local/include"))

  (use-package cmake-font-lock)

  (use-package modern-cpp-font-lock
    :init
    (modern-c++-font-lock-global-mode t))

  :custom
  (setq c-basic-offset 4)
  (c-set-style "bsd"))

(provide 'init-c++)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-c++.el ends here
