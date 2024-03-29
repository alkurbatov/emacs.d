;;; play-sound.el --- play sound files on OSX  -*- lexical-binding: t; -*-

;; Copyright (C) 2011-2013  Leo Liu

;; Author: Leo Liu <sdl.web@gmail.com>
;; Version: 1.0
;; Keywords: comm, tools, convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provide a compatibility layer for play-sound on OSX since
;; play-sound-internal is not implemented.
;; See: https://github.com/leoliu/play-sound-osx

;; Patched by Alexander Kurbatov <sandro.kurbatov@gmail.com>
;; to get rid of deprecated cl package.
;; See:
;; https://github.com/leoliu/play-sound-osx/issues/2

;;; Code:
(defun play-sound-internal (sound)
  "Overload internal function playing SOUND."
  (or (eq (car-safe sound) 'sound)
      (signal 'wrong-type-argument (list sound)))

  (cl-destructuring-bind
   (&key file data volume device) (cdr sound)

   (and (or data device) (error "DATA and DEVICE arg not supported"))

   (apply #'start-process
          "afplay" nil "afplay"
          (append
           (and volume (list "-v" volume))
           (list (expand-file-name file data-directory))))))

(provide 'play-sound)
;;; play-sound.el ends here
