;; init.el --- Main initialisation routine. -*- lexical-binding: t -*

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
;; A Fancy Emacs Configuration.
;;

;;; Code:

;; Increase the amount of data Emacs reads from a process,
;; LSP client optimization.
(setq read-process-output-max (* 1024 1024))

;; Portion of heap used for allocation. Defaults to 0.1.
(setq gc-cons-percentage 0.6)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; Packages.
(require 'init-package)

;; General settings.
(require 'init-basic)
(require 'init-edit)
(require 'init-ui)
(require 'init-theme)
(require 'init-calendar)

;; Programming.
(require 'init-prog)
(require 'init-git)
(require 'init-projectile)
(require 'init-ivy)
(require 'init-flycheck)
(require 'init-help)
(require 'init-dired)
(require 'init-yasnippet)

;; Tooling
(require 'init-docker)
(require 'init-makefile)
(require 'init-org)
(require 'init-ssh)
(require 'init-terminal)

;; Languages.
(require 'init-bash)
(require 'init-c++)
(require 'init-go)
(require 'init-jinja2)
(require 'init-js)
(require 'init-lisp)
(require 'init-markdown)
(require 'init-protobuf)
(require 'init-ps1)
(require 'init-python)
(require 'init-r)
(require 'init-toml)
(require 'init-typescript)
(require 'init-vue)
(require 'init-yaml)

;; Suppress message "For information about GNU Emacs...".
;; By some reason work only when set in the main init.el.
(setq inhibit-startup-echo-area-message "alkurbatov")

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook
 'emacs-startup-hook
 (lambda ()
   (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                    (float-time
                     (time-subtract
                      after-init-time
                      before-init-time)))
            gcs-done)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
