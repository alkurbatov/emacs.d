;; init-help.el --- Initialize documentation and search configurations. -*- lexical-binding: t -*

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
;; Documentation and search configuration.
;;

;;; Code:
(require 'init-consts)

;; Show nice-looking embedded help.
(use-package helpful
  :bind
  (("C-h f"   . helpful-callable)
   ("C-h v"   . helpful-variable)
   ("C-h k"   . helpful-key)
   ("C-c C-d" . helpful-at-point)
   ("C-h F"   . helpful-function)
   ("C-h C"   . helpful-command)))

(use-package engine-mode
  :if (display-graphic-p)

  :config
  ;; Binded to 'C-x /' by default
  (engine-mode t)

  (defengine google
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
    :keybinding "g")

  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "h")

  (defengine stack-overflow
    "https://stackoverflow.com/search?q=%s"
    :keybinding "s")

  (defengine cppreference
    "https://duckduckgo.com/?sites=cppreference.com&q=%s&ia=web"
    :keybinding "c")

  (defengine python
    "https://docs.python.org/3/search.html?q=%s&check_keywords=yes&area=default"
    :keybinding "p"))

(provide 'init-help)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-help.el ends here
