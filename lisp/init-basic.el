;; init-basic.el --- Better default configurations. -*- lexical-binding: t -*

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
;; Better defaults.
;;

;;; Code:
(require 'init-consts)

;; Backups.
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms
      `((".*" , "~/.emacs.d/backups/" t)))

(fset 'yes-or-no-p 'y-or-n-p) ; answer y or n instead of yes or no

;; Buffers.
(kill-buffer "*scratch*") ; usually not used

;; Start in fullscreen.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Inject paths to brew programs when Emacs is started from Spotlight.
(use-package exec-path-from-shell
  :if sys/mac-x-p

  :init
  (setq
   exec-path-from-shell-variables '("PATH" "MANPATH")
   exec-path-from-shell-arguments '("-l"))

  (exec-path-from-shell-initialize))

;; Mouse.
(xterm-mouse-mode t) ; enable basic mouse support to prevent scrolling issues etc

(provide 'init-basic)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-basic.el ends here
