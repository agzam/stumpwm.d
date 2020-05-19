(in-package #:stumpwm)

(define-key *top-map* (kbd "s-:") "colon")
(define-key *top-map* (kbd "s-!") "exec")
(define-key *top-map* (kbd "s-n") "pull-hidden-next")
(define-key *top-map* (kbd "s-p") "pull-hidden-previous")
(define-key *top-map* (kbd "C-s-ESC") "run-shell-command systemctl suspend")
(define-key *help-map*  (kbd "R") "loadrc")
(define-key *root-map*  (kbd "SPC") "run-shell-command albert show")

(defvar *window-bindings* nil)
(setf *window-bindings*
      (let ((m (make-sparse-keymap)))
        (define-key m (kbd "v") "hsplit")
        (define-key m (kbd "s") "vsplit")
        (define-key m (kbd "w") "other")
        (define-key m (kbd "W") "fselect")
        (define-key m (kbd "l") "move-focus right")
        (define-key m (kbd "h") "move-focus left")
        (define-key m (kbd "j") "move-focus down")
        (define-key m (kbd "k") "move-focus up")
        (define-key m (kbd "L") "move-window right")
        (define-key m (kbd "H") "move-window left")
        (define-key m (kbd "J") "move-window down")
        (define-key m (kbd "K") "move-window up")
        (define-key m (kbd "m") "only")
        (define-key m (kbd "d") "remove-split")
        (define-key m (kbd "=") "balance-frames")
        (define-key m (kbd "e") "expose")
        (define-key m (kbd ".") "iresize")
        m))

(undefine-key *root-map* (kbd "k"))
(undefine-key *root-map* (kbd "K"))
(define-key *root-map* (kbd "h") "move-focus left")
(define-key *root-map* (kbd "l") "move-focus right")
(define-key *root-map* (kbd "j") "move-focus down")
(define-key *root-map* (kbd "k") "move-focus up")
(define-key *root-map* (kbd "H") *help-map*)
(define-key *root-map* (kbd "w") '*window-bindings*)

(loop for n from 0 to 9
      for key = (kbd (write-to-string n))
      for cmd = (concatenate 'string "fselect " (write-to-string n))
      do (define-key *root-map* key cmd))

(defvar *buffers-bindings* nil)
(setf *buffers-bindings*
      (let ((m (make-sparse-keymap)))
        (define-key m (kbd "b") "pull-from-windowlist %n %c")
        (define-key m (kbd "d") "delete")
        (define-key m (kbd "D") "kill")
        m))
(define-key *root-map* (kbd "b") '*buffers-bindings*)

(define-remapped-keys
    '(("(Brave|Chrome|Firefox)"
       ;; navigation Emacs-style
       ("C-n" . "Down")
       ("C-p" . "Up")
       ("C-f" . "Right")
       ("C-b" . "Left")

       ;; navigation Vim-style
       ("M-h" . "Left")
       ("M-l" . "Right")
       ("M-j" . "Down")
       ("M-k" . "Up")

       ;; seach
       ("s-f" . "C-f")
       ("s-g" . "C-g")
       ("s-G" . "C-G")

       ;; tabs
       ("s-k" . "C-Tab")
       ("s-j" . "C-S-Tab")
       ("s-w" . "C-w")
       ("s-t" . "C-t")
       ("s-T" . "C-T")
       ("s-r" . "C-r")
       ("s-0" . "C-0")
       ("s-1" . "C-1")
       ("s-2" . "C-2")
       ("s-3" . "C-3")
       ("s-4" . "C-4")
       ("s-5" . "C-5")
       ("s-6" . "C-6")
       ("s-7" . "C-7")
       ("s-8" . "C-8")
       ("s-9" . "C-9")

       ;; copy-cut-paste
       ("s-c" . "C-c")
       ("s-x" . "C-x")
       ("s-v" . "C-v")

       ("M-DEL" . "C-DEL")
       ("s-=" . "C-=")
       ("s--" . "C--")

       ("s-L" . "C-l") ; jump to address bar

       )))

;;;;;;;;;;
;; apps ;;
;;;;;;;;;;

(defcommand browser () () (run-or-raise "brave" '(:class "Brave-browser")))

(defvar *apps-bindings* nil)
(setf *apps-bindings*
      (let ((m (make-sparse-keymap)))
        (define-key m (kbd "g") "browser")
        (define-key m (kbd "e") "emacs")
        (define-key m (kbd "m") "media-app")
        (define-key m (kbd "t") "run-shell-command terminator")
        (define-key m (kbd "T") "run-shell-command telegram-desktop")
        m))

(define-key *root-map* (kbd "a") '*apps-bindings*)
