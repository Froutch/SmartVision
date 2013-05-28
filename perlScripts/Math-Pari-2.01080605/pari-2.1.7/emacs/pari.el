;; This is the interface for pari under emacs.
;; The main commands in this file are :
;; M-x gp      Opens a buffer for interaction with gp and then starts gp.
;; C-u M-x gp  Like M-x gp, but prompts for command line arguments.
;; M-x gpman   Displays the gp-pari manual using any dvi preview program.

;; All functions of gp are preserved.

;; Version 2.38 (2-July-2000)
;; The original pari.el was written by Annette Hoffman.
;; Modified by David Carlisle (JANET: carlisle@uk.ac.man.cs).
;; Modified by Karim Belabas (belabas@math.u-bordeaux.fr) for gp 2.xxx.
;; Modified by Olivier Ramare (ramare@gat.univ-lille1.fr).

;; Maintainer (22-November-1998): Olivier Ramare (ramare@agat.univ-lille1.fr).

;; See pariemacs.txt  for more details.

;; KNOWN DEFICIENCIES:
;;  -- The hilit part may have troubles with `}'. A `}' followed by
;;     a newline indicates the end of a function-definition starting with
;;     `{'. Spaces, or tab are *not* allowed. So if you use `}' as a string
;;     DON'T have it followed by a newline.

;; This file is split in six parts :
;;   PART I : MAIN CONSTANTS (contains a macro).
;;            Some of them may have to be modified by the user.
;;            The macro 'gp-defcustom is defined there.
;; PART  II : KEYMAPS AND OTHER VARIABLES
;;            including the two macros 'gp-hilit-init and
;;            'gp-tell-hilit-about-patterns. Also the substitution
;;            'gp-setup is being defined there.
;; PART III : gp-mode AND gp-script-mode
;; PART  IV : GENERAL FUNCTIONS
;;            Contains: HANDLING THE WINDOWS ...
;;                      THE GP PROCESS
;;                      META-COMMANDS
;;                      GP COMPLETION FUNCTIONS
;;                      COMPLETION FILES
;;                      TeX MANUAL
;;                      GP HELP MODE
;;                      TeX AND USUAL INFO
;;  PART  V : HILIGHTING
;;  PART VI : MENU-BAR
;;            Contains: MENU BUILDERS (contains 3 constants)
;;                      MENU-BAR ITEM USED IN GP-SCRIPT-MODE
;;                      MENU-BAR ITEM USED IN GP-MODE
;;
;; Note that this order is not random! In order for the compilation
;; to work properly with macros, they *should* be defined before
;; they are called (if emacs-version is below 20.3).

(provide 'pari)
(eval-when-compile
  (setq byte-compile-warnings (list 'unresolved 'callargs 'redefine 'obsolete)))
(eval-and-compile (require 'backquote)) ; This file is used in macros.

;;--------------------------
;; PART I : MAIN CONSTANTS
;;--------------------------

;; CONFIGURE:
(defconst gp-version "2.1.7")
;; Set the following five constants for your site:

;; CONFIGURE:
(defconst gp-gphelp-dir "/usr/local/bin/"
  "The directory where gphelp is to be found")

;; CONFIGURE:
(defconst gp-file-name "/usr/local/bin/gp"
 "The file name of the gp executable file")

;; To customize variables:
(eval-and-compile
(defvar old-emacs-versionp t)
(save-excursion
  (set-buffer "*Messages*")
  (let ((pt (point)))
       (emacs-version t)
       (goto-char pt)
       (if (re-search-forward "\\(GNU Emacs\\|\\) \\([^ ]*\\) " nil t)
           (setq old-emacs-versionp (not (string-lessp "20.3" (match-string 2))))
           (setq old-emacs-versionp t))))
  ;; Shut up compiler:
  (if old-emacs-versionp
     (progn (fset 'defgroup (lambda (a b c &rest d) "" nil))
            (fset 'custom-declare-variable
                  (lambda (a b c &rest d) "" nil))
            (fset 'frame-parameter (lambda (a b) "" nil))))
)
  ;; This variable is required since some functions are not
  ;; supported by earlier versions.

(defmacro gp-defcustom (symbol value doc &rest args)
 "If emacs-version is larger than 20, then customization of the
variables is allowed, else no."
   (` (if old-emacs-versionp
      (, (list 'defvar symbol value
               ;; The "doc" string of a customizable variable starts
               ;; with a "*". Remove it here.
               (list 'substring doc 1)))
      ;; definition of 'defcustom taken from custom.el:
      (, (nconc (list 'custom-declare-variable
	       (list 'quote symbol)
	       (list 'quote value)
	       doc)
	 args)))))

(eval-and-compile
(or old-emacs-versionp
(defgroup gp nil
"Major mode for editing GP source in Emacs"
:group 'languages)))

;; CONFIGURE:
(gp-defcustom gp-readline-enabledp nil
"*t if readline is enabled. Emacs will try to set it properly
whenever a gp-session is started."
:type 'boolean
:group 'gp)

(gp-defcustom pari-colors 
;; CONFIGURE ??
 (eval (expand-file-name (concat gp-gphelp-dir "pari-colors.el" )))
"*Where the choice of colors is stored"
:type 'file
:group 'gp)

;; Should be set in a hook if pari.el is installed on a network,
;; since these colors are user dependent. It is reset in
;; 'gp-hilit-translate called by 'gp-hilit-init after reading the hooks.
;; Both 'gp-mode and 'gp-script-mode provide a default if
;; the chosen file is not writable. This should take care of the case
;; of a casual user accessing to gp through a network.

(gp-defcustom gp-additional-cpl-file ""
"*A name (string) of a completion file used in supplement for completion.
This file should have the format of 'gp-menu files."
:type 'file
:group 'gp)

(gp-defcustom gp-tutorial-requiredp t
"*T if comments should be given for some functions."
:type 'boolean
:group 'gp)
;; The functions concerned are : 'gp-cmd2-to-paint, 'gp-make-cpl-file

;; CONFIGURE:
(defconst gp-dvi-preview "xdvi -s 3"
;; (defconst gp-dvi-preview "texsun"
 "dvi previewer (and options)")

(gp-defcustom gp-no-menu-bar nil
"*A non nil value means that we do not want any menu-bar"
:type 'boolean
:group 'gp)

(gp-defcustom gp-no-color-item nil
"*T means remove the menu-bar item [GP/Colors]"
:type 'boolean
:group 'gp)

(gp-defcustom gp-no-hilit nil
"*If this variable is non-nil don't highlight GP scripts and *PARI* buffer.
Note however that any change of value will become effective only during
next session."
;; Simply because the really relevant variable is 'gp-can-hilit.
:type 'boolean
:group 'gp)

(gp-defcustom gp-no-separate-window-for-mistakes t
"*T means errors under the gp calculator will not be
displayed on a separate window."
:type 'boolean
:group 'gp)

(defconst gp-temp-directory "/tmp/"
  "*Directory in which to create temporary files.")

(defvar gp-temp-file
  (expand-file-name (concat gp-temp-directory (make-temp-name "gp_#")))
  "Temporary file name used for text being sent as input to GP.")

(defvar gp-el-temp-file
  (expand-file-name (concat gp-temp-directory (make-temp-name "gp_#.el")))
  "Temporary file name used for text being sent as input to emacs.")

(defconst gp-max-saved-wind-conf 20
  "Maximal number of saved window configurations")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Individual users may want to re-set some of the variables in this section
;; in a gp-mode-hook in their .emacs file (see pariemacs.txt for examples).

(gp-defcustom gp-stack-size 10000000
"*Default stack size passed to gp."
:type 'integer
:group 'gp)

(gp-defcustom gp-prime-limit 500000
"*Default prime limit passed to gp."
:type 'integer
:group 'gp)

(gp-defcustom gp-prompt-for-args nil
  "*A non-nil value makes M-x gp act like C-u M-x gp, 
ie prompt for the command line arguments."
:type 'boolean
:group 'gp)

(gp-defcustom gp-keep-PARI-buffer-when-quitting nil
"*T means what it says..."
:type 'boolean
:group 'gp)

(gp-defcustom gp-locked-modep t
  "*t means you cannot write above the last prompt.
If you try to modify an earlier input, emacs will automatically copy
it at the bottom of your file."
:type 'boolean
:group 'gp)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; CAUTION :
;; Because of the new prompt capabilities in gp-2 (e.g self-modifying...),
;; it is now the user responsibility to set gp-prompt-pattern correctly.
;; This can't be done automagically in a satisfactory way

(defvar gp-prompt-pattern
  "^[?>][\n\t ]*"
  "*Regexp used to match gp prompts.
   can be set with gp-set-prompt (bound to M-\\ p)")

;;----------------------------------------
;; PART  II : KEYMAPS AND OTHER VARIABLES
;;----------------------------------------

(defsubst gp-print-if-compiling (messg)
  (if (get-buffer "*Compile-Log*")
    (save-excursion
      (set-buffer "*Compile-Log*")
      (insert messg "\n"))))

(defsubst gp-setup nil
  (defconst gp-places-list
    (list
    ''gp-error ''gp-history ''gp-prompt  ''gp-output ''gp-input
    ''gp-help  ''gp-timer   ''gp-comment ''gp-string ''gp-control-statement
    ''gp-default-keywords   ''gp-default-set         ''gp-input-cmd
    ''gp-global-var         ''gp-function-proto      ''gp-function-args)
  ;; To add something to this list, like ''gp-warning,
  ;; set also the proper default in 'gp-hilit-translate,
  ;; and define the corresponding pattern in
  ;; 'gp-tell-hilit-about-patterns if it is for gp-mode, or
  ;; in 'gp-hilit-init if it is for gp-script-mode.
  "List of symbolic-names of faces which are linked with patterns to
  be hilighted via 'gp-hilit-init and 'gp-tell-hilit-about-patterns")
  ;; This function is used in a constant definition in hilit19:
  (fset 'x-display-color-p (lambda (&optional DISPLAY) t))
  (or (featurep 'hilit19) (load "hilit19" t))
  (or (featurep 'easymenu) (load "easymenu" t))
  (or (featurep 'hilit19)
      (progn
        ;; Curiously enough, this part is essentially only crap for
        ;; the compiler. If hilit19 is loaded when this is used then
        ;; the proper definitions will be used !
        (gp-print-if-compiling "No highlighting: hilit19.el not found.")
        (defvar hilit-face-translation-table nil)
        (defvar hilit-background-mode 'light)
        (mapcar (lambda (agpplace)
                  (eval (list 'defvar (eval agpplace) nil)))
                gp-places-list)
        (fset 'hilit-translate nil)
        (fset 'hilit-set-mode-patterns nil)
        (fset 'hilit-string-find nil)
        (fset 'hilit-rehighlight-region nil)
        (fset 'hilit-unhighlight-region nil)
        (fset 'hilit-rehighlight-buffer nil)
        (fset 'hilit-recenter nil)
        (setq gp-no-hilit t)))
  (or (featurep 'easymenu)
      (progn
        ;; This part is no crap ! 'easymenu has to be present
        ;; at compilation time.
        (gp-print-if-compiling "No menu-bar: easymenu.el not found.")
        (fset 'easy-menu-define nil)
        (setq gp-no-menu-bar t))))

(gp-setup)
(eval-when-compile (setq byte-optimize t) (gp-setup))

(defvar gp-input-filter-hook nil
  "Hook run in 'gp-input-filter")

(defconst gp-c-array (make-vector 800 0)
  "obarray used for completing gp command names")
;; pari-2.0.11-beta contains 495 function names.
;; We extend it by 305 for local ones.

(defvar gp-can-hilit nil "")
(defvar gp-process nil "t if a GP process is running.")

;; Topology of a menu-buffer : three parts delimited
;; by 'gp-menu-start-simple/'gp-menu-end-simple
;;    'gp-menu-start-special/'gp-menu-end-special
;;    'gp-menu-start-keywords/'gp-menu-end-keywords
;; The first part is made of items displayed on gp-menu-nbcol columns
;; of width gp-menu-width; selecting an item in this region will
;; ask 'gp-get-man-entry. The second part is made of longer items
;; displayed on a single columns and selecting them will also
;; call 'gp-get-man-entry. The third part is made of keywords
;; displayed on a single column which when selected will call
;; 'gp-get-apropos.
(defvar gp-menu-start-simple 0
"Value of point at the beginning of the first menu-region")
(defvar gp-menu-end-simple 0
"Value of point at the end of the first menu-region")
(defvar gp-menu-width 1)
(defvar gp-menu-nbcol 1)
(defvar gp-menu-start-special 0
"Value of point at the beginning of the second menu-region")
(defvar gp-menu-end-special 0
"Value of point at the end of the second menu-region")
(defvar gp-menu-start-keywords 0
"Value of point at the beginning of the third menu-region")
(defvar gp-menu-end-keywords 0
"Value of point at the end of the third menu-region")

(mapcar 'make-variable-buffer-local
  '(gp-menu-start-simple gp-menu-end-simple
    gp-menu-start-special gp-menu-end-special gp-menu-start-keywords gp-menu-end-keywords))

(defvar gp-input-start nil
"Beginning of the expression to be send to GP. See gp-copy-input.")
(defvar gp-input-end nil
"End of the expression to be send to GP. See gp-copy-input.")
(defvar gp-complete-expression nil
"t if expression to be send to GP is complete. See gp-copy-input.")
(defvar gp-input-start-bracketp nil
"t if expression to be send to GP starts with a {.")
(defvar gp-reads-this-buffer nil
"name of the buffer gp is interpreting.")
(defvar gp-latest-error nil
"Regexp matching latest execution error. It contains a grouping
whose closing parenthesis corresponds to the point where gp
has detected a mistake.")
(defvar gp-registers-list nil
"List of registers from 0 to (1- gp-max-saved-wind-conf)
where window-configurations are stored.
See gp-store-wind-conf and gp-restore-wind-conf.")
(defvar gp-should-wait-for-outputp t
"t if gp should wait for output and hilit it
in gp-send-input. Automatically reset to t after each
input. See also gp-input-filter.")
(defvar pari-colors-modifiedp nil
"t if the color of a gp-place has been modified")
(defvar pari-colors-initp nil
"t is colors have been initialised")
(defvar gp-menu-loadedp nil
"t if the file gp-menu is already used for completion")
(defvar gp-main-menu-list nil
"Set by 'gp-cpl-init.")

(defconst gp-main-menu-keywords-list
  '("elliptic curve" "number field" "bnf"))

(defvar gp-browser-2-map nil "Keymap used in 'gp-browser-2-mode.")

(if (not (eq gp-browser-2-map nil))
nil
(setq gp-browser-2-map (make-sparse-keymap))
(define-key gp-browser-2-map "\C-m"     (function gp-browser-2-select))
(define-key gp-browser-2-map [mouse-2]  (function gp-browser-2-mouse-select))
(define-key gp-browser-2-map [right]    (function gp-menu-right))
(define-key gp-browser-2-map [left]     (function gp-menu-left)))

(defvar gp-browser-1-map nil "Keymap used in 'gp-browser-1-mode.")

(if (not (eq gp-browser-1-map nil))
nil
(setq gp-browser-1-map (make-sparse-keymap))
(define-key gp-browser-1-map "\C-m"    (function gp-browser-1-select))
(define-key gp-browser-1-map [mouse-2] (function gp-browser-1-mouse-select)))

(defvar gp-browser-main-alist nil)
(defvar gp-browser-width 0
"The alist 'gp-browser-main-alist consists of conses (NUM . STRING).
'gp-browser-var is the length of the largest STRING.")

(defvar gp-browser-follow-alist nil)
(defvar gp-main-frame nil "The main frame if non nil.")
(defvar gp-browser-frame nil "GP-browser frame if non nil.")
(defvar gp-browser-process nil "A simple gp process opened to build the browser.")
(defvar gp-browser-style 3
"*Style for GP-browser. Three styles are possible, 1, 2 and 3.
Best to try them on.")

(defvar gp-cpl-lists-list
    '(gp-c-array)
 "List of the lists/arrays to be used for completion on top of the
completion already delivered by readline if present and by the general
'gp-c-array which has to be the first element of this list.")

(defconst gp-separator (list "----------") "")

(defconst gp-function-proto-pstart
   "\\(^ *\\|{\\)\\([a-zA-Z][_a-zA-Z0-9]*\\)([^)]*) *=[^=]"
   "Regexp matching the beginning of a function-definition")

(defconst gp-letters-list
  '(97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 48 49 50 51 52 53 54 55 56 57 95 61 43 45 42 47 124 94 58 33 35 40 41 91 93 123 125 126 37 36 44 59 46 38 63 39 96 60 62 32 34 92)
;  (string-to-list "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_=+-*/|^:!#()[]{}~%$,;.&?'`<> \"\\")
"See 'gp-define-locked-keys.")

(defvar gp-colors-list
  (list 'default 'red 'red3 'magenta3 'brown 'green3 'grey50 'grey40
        'deepskyblue1 'hex-80a0ff 'blue3 'yellow 'hex-ffff60)
  "A list of symbolic-names of faces used + some default ones.")
(defvar gp-color-menu-list nil
  "List containing the color menu.")

(defvar gp-syntax-table nil
  "Syntax table in use in gp-mode and gp-script-mode buffers.")

(if gp-syntax-table
    ()
  (setq gp-syntax-table (make-syntax-table))
  (modify-syntax-entry ?( "()"  gp-syntax-table)  
  (modify-syntax-entry ?) ")("  gp-syntax-table)
  (modify-syntax-entry ?[ "(]"  gp-syntax-table)  
  (modify-syntax-entry ?] ")["  gp-syntax-table)
  (modify-syntax-entry ?{ "(}"  gp-syntax-table)  
  (modify-syntax-entry ?} "){"  gp-syntax-table)
  (modify-syntax-entry ?# "."   gp-syntax-table)
  (modify-syntax-entry ?~ "_"   gp-syntax-table)  ; symbol constituent
  (modify-syntax-entry ?! "_"   gp-syntax-table)  ; symbol constituent
  (modify-syntax-entry ?+ "."   gp-syntax-table)
  (modify-syntax-entry ?- "."    gp-syntax-table)
  ;(modify-syntax-entry ?/  ". 1456" gp-syntax-table) ; XEmacs?
  (modify-syntax-entry ?/  ". 14" gp-syntax-table)
  (modify-syntax-entry ?*  ". 23"   gp-syntax-table)
  (modify-syntax-entry ?\\ ". 12b" gp-syntax-table)
  (modify-syntax-entry ?. "w" gp-syntax-table)  ; used for
  (modify-syntax-entry ?' "w" gp-syntax-table)

  (if (string-match "XEmacs" emacs-version)
      (progn
      (modify-syntax-entry ?\n ">b"  gp-syntax-table)
      ;; Give CR the same syntax as newline, for selective-display
      (modify-syntax-entry ?\^m ">b" gp-syntax-table)
      )
    (modify-syntax-entry ?\n "> b"  gp-syntax-table)
    ;; Give CR the same syntax as newline, for selective-display
    (modify-syntax-entry ?\^m "> b" gp-syntax-table)
    )
  (modify-syntax-entry ?= "."    gp-syntax-table)
  (modify-syntax-entry ?% "_"    gp-syntax-table) ; symbol constituent
  (modify-syntax-entry ?< "."    gp-syntax-table)
  (modify-syntax-entry ?> "."    gp-syntax-table)
  (modify-syntax-entry ?$ "w"    gp-syntax-table)
  (modify-syntax-entry ?| "."    gp-syntax-table)
  (modify-syntax-entry ?_ "w"    gp-syntax-table))

(defun gp-define-locked-keys nil
  (mapcar
    (lambda (achar)
      (define-key gp-map (vector achar)
                  (if gp-locked-modep
                      'gp-locked-self-insert-command
                      'self-insert-command)))
    gp-letters-list)
  (if gp-locked-modep
      (progn
        (define-key gp-map [mouse-2] 'gp-locked-mouse-2)
        (define-key gp-map "\C-?"    'gp-locked-backward-delete-char-untabify)
        (define-key gp-map "\C-y"    'gp-locked-yank))
      (define-key gp-map [mouse-2] 'gmouse-yank-at-click)
      (define-key gp-map "\C-?"    'backward-delete-char-untabify)
      (define-key gp-map "\C-y"    'yank)))

(defvar gp-map nil
  "Local keymap used in buffer *PARI*.")

(if (not (eq gp-map nil))
nil
(setq gp-map (make-sparse-keymap))
(gp-define-locked-keys)
(define-key gp-map "\t"      (function gp-complete))
(define-key gp-map "\C-m"    (function gp-send-local-input))
(define-key gp-map "\M-c"    (function gp-copy-input))
(define-key gp-map "\M-\C-m" (function gp-C-j))
(define-key gp-map "\C-j"    (function gp-C-j))
(define-key gp-map "\M-\t"   (function gp-complete))
(define-key gp-map "\C-c"    (function gp-interrupt))
(define-key gp-map "\M-\\\\" (function gp-break-long-line))
(define-key gp-map "\M-\\a"  (function gp-meta-a))
(define-key gp-map "\M-\\b"  (function gp-meta-b))
(define-key gp-map "\M-\\c"  (function gp-menu))
(define-key gp-map "\M-\\d"  (function gp-meta-d))
(define-key gp-map "\M-\\m"  (function gp-meta-m))
(define-key gp-map "\M-\\p"  (function gp-set-prompt))
(define-key gp-map "\M-\\q"  (function gp-meta-q))
(define-key gp-map "\M-\\r"  (function gp-meta-r))
(define-key gp-map "\M-\\s"  (function gp-meta-s))
(define-key gp-map "\M-\\t"  (function gp-meta-t))
(define-key gp-map "\M-\\v"  (function gp-meta-v))
(define-key gp-map "\M-\\w"  (function gp-meta-w))
(define-key gp-map "\M-\\x"  (function gp-meta-x))
(define-key gp-map "\M-?"    (function gp-get-man-entry))
(define-key gp-map "\M-H"    (function gp-get-apropos))
(define-key gp-map "\C-p"    (function previous-line))
(define-key gp-map "\C-n"    (function next-line))
(define-key gp-map "\M-p"    (function gp-previous-cmd))
(define-key gp-map "\M-n"    (function gp-next-cmd))
(define-key gp-map "\M-s"    (function gp-skip-to-error))
(define-key gp-map [C-kp-subtract] (function gp-remove-last-output))
(define-key gp-map [M-kp-subtract] (function gp-remove-last-action))
)

(defvar gp-script-map nil
  "Local keymap used in gp-script-mode.")

(if (not (eq gp-script-map nil))
nil
(setq gp-script-map (make-sparse-keymap))
(define-key gp-script-map "\t"      (function gp-complete))
(define-key gp-script-map "\M-\t"   (function gp-complete))
(define-key gp-script-map "\M-\\\\" (function gp-break-long-line))
(define-key gp-script-map "\M-\\d"  (function gp-meta-d))
(define-key gp-script-map "\M-\\c"  (function gp-menu))
(define-key gp-script-map "\M-?"    (function gp-get-man-entry))
(define-key gp-script-map "\M-H"    (function gp-get-apropos))
(define-key gp-script-map "\M-\\t"  (function gp-meta-t))
(define-key gp-script-map "\M-\\v"  (function gp-meta-v))
(define-key gp-script-map "\M-\\z"  (function gp-run-in-region))
(define-key gp-script-map "\M-s"    (function gp-skip-to-error))
)

(defvar gp-menu-map nil
  "Local keymap used in gp menu buffer.")

(if (not (eq gp-menu-map nil))
nil
(setq gp-menu-map (make-sparse-keymap))
(define-key gp-menu-map "\C-n" (function gp-menu-next))
(define-key gp-menu-map "\C-p" (function gp-menu-previous))
(define-key gp-menu-map "\C-m" (function gp-menu-select))
(define-key gp-menu-map [mouse-2] (function gp-menu-mouse-select))
(define-key gp-menu-map "q"    (function gp-menu-quit))
(define-key gp-menu-map "s"    (function gp-menu-survey))
(define-key gp-menu-map "\C-v" (function gp-menu-C-v))
(define-key gp-menu-map "\M-v" (function gp-menu-M-v))
(define-key gp-menu-map [right] (function gp-menu-right))
(define-key gp-menu-map [left] (function gp-menu-left))
)

;; Global keys. They *should* be global.

(define-key esc-map "o" (function gp-restore-wind-conf))

(define-key completion-list-mode-map [mouse-2] (function gp-mouse-2))

;; Maps used for the menu-bar.

(defvar GP-menu-map nil
"Keymap used for the menu-bar item GP in gp-mode")

(defvar GP-script-menu-map nil
"Keymap used for the menu-bar item GP in gp-script-mode")

;; Functions that behaves like constants.

(defun gp-tell-hilit-about-patterns nil
  "Patterns to be hilighted under gp-mode."
  ;; Essentially a constant.
   (hilit-set-mode-patterns
    'gp-mode
      (cons 
        (cons gp-prompt-pattern  '(nil gp-prompt))
        (cons 
          (cons
            (concat "\\(" gp-prompt-pattern "\\)" "\\(.*$\\)")
            '(2 gp-input))
          '( ("^ *%[0-9]* ="           nil  gp-history)
             ("time = \\([0-9][hmn,0-9 ]* ms\.\\)"  1 gp-timer)
             ("^[a-zA-Z][a-zA-Z0-9_]*([^ )]*): "              "^$" gp-help)
             ("\\*\\*\\*.*"            nil  gp-error)
             ("\\<\\(buffersize\\|colors\\|compatible\\|debug\\|debugmem\\|echo\\|format\\|help\\|histsize\\|logfile\\|output\\|parisize\\|path\\|primelimit\\|prompt\\|psfile\\|realprecision\\|seriesprecision\\|simplify\\|strictmatch\\|timer\\)\\>" nil gp-default-keywords)
             ;; In the next one, we avoid `log(10)' and `"pari.log"':
             ("[\\<\\.]\\(log\\)[^\\w\\.(\"]" 1 gp-default-keywords)
             ("^ *\\\\[a-z].*$"  nil gp-default-set)
             ("\\<\\(default\\)(" 2 gp-default-set)

             ("^ *%[0-9]* = \\(.*$\\)"  1   gp-output))))))

(defun gp-hilit-init nil
  "Enable highlighting in the PARI buffer"
   (and
     (setq gp-can-hilit 
        (and (not gp-no-hilit)
             (eq window-system 'x) (x-display-color-p)))
     (not pari-colors-initp)
    (progn
      (setq pari-colors-initp t)
     ;; while running GP
      (gp-tell-hilit-about-patterns)
  
    ;; to edit GP scripts.
      (hilit-set-mode-patterns
      'gp-script-mode
      '(  (gp-find-comment nil gp-comment)

          ("\\<\\(return\\|next\\|if\\|until\\|while\\|\\|fordiv\\|forprime\\|forstep\\|forvec\\|for\\) *(" 1 gp-control-statement)

          ("\\<\\(break\\)[^a-zA-Z0-9_]" 1 gp-control-statement)

          ("\\<\\(default\\)("  1 gp-default-set)
          ("\\<read\\>[^a-zA-Z0-9_]"  0 gp-input-cmd)
          ("\\<\\(local\\)\\([ \t\n]*(\\)"  1 gp-input-cmd)


          (hilit-string-find ?\\ gp-string)

          (gp-find-global-var nil gp-global-var)
          
          ("\\(^\\|{[\n\t ]*\\) *\\([a-zA-Z]\\w*\\)([^)]*) *=[^=]" 2 gp-function-proto)

          ("\\(^\\|{[\n\t ]*\\) *[a-zA-Z]\\w*(\\([^)]*\\)) *=[^=]" 2 gp-function-args))))

      ;; Convert the symbols 'gp-function-args and so on into
      ;; faces (well, not exactly : into other symbolic-names of faces
      ;; but which are associated to a face):
      (gp-hilit-translate)

      ;; Work out the list of symbolic-names of faces used:
      (gp-init-gp-colors-list)
      ))

(gp-defcustom gp-language 'francais
"*Any of 'francais 'english 'deutsch."
:type '(choice (const francais) (const english)); (const deutsch))
:group 'gp)

(defconst gp-messages-list
  '((francais  .
      ("Nous utilisons le choix par defaut pour la completion"  ;; no 1
       "Elimination de %s"                            ;; no 2
       " Sauvegarde des couleurs ? "                  ;; no 3
       "M-o ou ESC-o pour oter la fenetre d'aide"     ;; no 4
       "APPUYER SUR UNE TOUCHE POUR CONTINUER..."     ;; no 5
       "termine."                                     ;; no 6
       "En attente de la reponse de gp ..."           ;; no 7
       "Impossible de lancer gp."                     ;; no 8
       "Expression incomplete."                       ;; no 9
       "Ce nouveau prompt peut conduire a une erreur. Mieux vaut le changer via M-\\p"  ;; no 10
        "Version numero %s."                          ;; no 11
        "Mode Tutorat active"                         ;; no 12
        "Mode Tutorat desactive"                      ;; no 13
        "Echange les fonctions des touches C-p/M-p and C-n/M-n."
        "gp essaie de completer ..."                  ;; no 15
        "C-u M-o pour sortir de l'edition."           ;; no 16
        "Lancement de "                               ;; no 17
        "SPC=suivant DEL=precedent RET=selectionner s=survey-menu q=quitter"
        "Il n'y a rien a selectionner ici"            ;; no 19
        "Fonction inconnue : %s"                      ;; no 20
        "Fonction"                                    ;; no 21
        "Variable utilisateur : %s"                   ;; no 22
        "Aucune occurence de \"%s\" n'a ete trouvee." ;; no 23
        "Chargement de pari-colors.el a partir de "   ;; no 24
        "### Variables globales : (une par ligne)"    ;; no 25
        "### Titres de chapitre :"                    ;; no 26
        "### Mots-cles interessants :"                ;; no 27
        "D'humeur aventureuse ? Un nom de \"face\" s'ecrit:\n FaceCaractere/FaceDecors-[bold,italic]-[underline]\n ou simplement: FaceCaractere.\n\nFace[Caractere|Decors] appartient a la liste (non-exhaustive) suivante :\nblack blue brown cyan DarkGoldenrod dimgrey firebrick ForestGreen Goldenrod green grey40 grey50 hex-80a0ff hex-ffff60 lightblue magenta mocassin OliveDrab orange pink Plum purple red RoyalBlue tan yellow white.\n De plus, vous pouvez souvent ajouter un suffixe entier entre 1 et 4, comme dans green3. Vous pouvez essaye le tres voyant firebrick/yellow-bold. L'italique ne se voit pas sur l'ecran mais est utilise quand vous demandez une impression via le sous-item `Postcript Print Buffer' de l'item `Tools'. Il faut remarquer que nil n'est pas la couleur par defaut... puisque cette couleur est tout simplement `default' !"  ;; no 28
        "Emacs utilise un fichier general contenant tous les noms des fonctions de PARI. En surplus, gp utilises un fichier appele nom-de-fichier.cpl des que nom-de-fichier est edite. Pour creer ce fichier, vous pouvez utilise l'item [GP Completion-File Edit-File...] de la barre de menu qui creera un fichier au format adequat contenant les noms des fonctions et des variables globales de votre programme. L'edition de ce fichier se fait via l'item [GP Completion-File Edit File...] de la barre de menu et vous pouvez aussi decider d'utiliser un autre fichier a l'aide de [GP Completion-File Use Also File...]."  ;; no 29
        "Rend les noms de fonctions et ceux des variables globales du programme %s (tel qu'il existe en ce moment) utilisables pour la completion. Ils seront stockes dans `%s.cpl' des que ce fichier sera edite. Le fichier `%s.cpl' est au format d'un fichier de completion (i.e. format du fichier gp-menu) et est automatiquement utilise pour la completion lorsque %s est edite."  ;; no 30
        "Fonctions/Sections dans la description desquelles \"%s\" apparait :"  ;;  no 31
        "Sujet"
        "Nom du fichier de completion : "                ;; no 33
        "Erreur introuvable."                                 ;;  no 34
        "Probable typo."                                 ;;  no 35
        (concat "Aucune erreur a localiser ou buffer (" gp-reads-this-buffer ") absent") ;; no 36
        "Le guide est en construction..." ;; no 37
        "Mouse-2 ou Return pour selectionner un item." ;; no 38
        "Le fichier pariemacs.txt n'est pas dans votre load-path. Vous devriez decouvrir ou il se situe, disons dans le directory /usr/local/lib/pari/emacs/ et ajouter la ligne\n (setq load-path (concat load-path \"/usr/local/lib/pari/emacs/\"))\ndans votre fichier .emacs (creez-le si besoin est)." ;; no 39
        "Nouvelle couleur :" ;; no 40
        "Appele avec : %s\n\n"       ;; no 41 
        "Autre..." ;; no 42
        "Couleurs" ;; no 43
        "Mise a jour"  ;; no 44
        "Sauvegarde" ;; no 45
        "Commutateur" ;; no 46
        "Tout recolorier" ;; no 47
        "MetaTouches" ;; no 48 "Metakeys"
        "Lire du Fichier..." ;; no 49 "Read from File..."
        "Ecrire sur le Fichier..." ;; no 50 "Write to File..."
        "Imprimer en..." ;; no 51 "Print in..."
        "Nouveau Prompt" ;; no 52 "New Prompt"
        "Simple"         ;; no 53 "Simple"
        "Avec l'heure"   ;; no 54 "With Time"
        "Avec la date"             ;; no 55
        "Avec un separateur"        ;; no 56
        "Lancer GP"      ;; no 57
        "Comme d'habitude"              ;; no 58
        "Changer les parametres..."  ;; no 59
        "GP evalue le fichier..."     ;; no 60
        "GP evalue la region"      ;; no 61
        "Quitter GP"       ;; no 62
        "Aide sur ce mode"     ;; no 63
        "Fichier de completion"       ;; no 64
        "Utiliser aussi le fichier..."      ;; no 65
        "Editter le fichier..."          ;; no 66
        "Creer/Mettre a jour"           ;; no 67
        ""           ;; no 68
        "Nom du programme:"                ;; no 69
        "+/- d'aide"            ;; no 70
        "Disposition precedente"           ;; no 71
        "Completer"                   ;; no 72
        "Aller a l'erreur"              ;; no 73
        "Entree/Sortie..."                  ;; no 74
        "Recopier la derniere entree"            ;; no 75
        "Oter le dernier resultat"         ;; no 76
        "Oter la derniere action"         ;; no 77
        "Basculer les touches"              ;; no 78
        ))
     (english .
       ("Using default choice for completion"            ;; no 1
        "Removing %s"
        " Save Colors ? "
        "M-o or ESC-o will remove the help window"
        "PRESS ANY KEY TO CONTINUE..."                   ;; no 5
        "done."
        "Waiting for gp output ..."
        "Could not start gp."
        "Incomplete expression : Not sent to gp."        ;; no 9
        "New prompt may lead to an error. Better to set it interactively via M-\\p"
        "Version number %s."
        "Tutorial mode activated"                     ;; no 12
        "Tutorial mode desactivated"                  ;; no 13
        "Exchange the bindings of the keys C-p/M-p and C-n/M-n."
        "Waiting for gp completion ..."               ;; no 15
        "C-u M-o to exit editing."                    ;; no 16
        "Starting "                                   ;; no 17
        "SPC=next DEL=previous RET=select s=survey-menu q=quit"
        "Nothing to be selected here"                 ;; no 19
        "Unknown function: %s"                        ;; no 20
        "Function"                                    ;; no 21
        "User Variable: %s"                           ;; no 22
        "No occurence of \"%s\" found."               ;; no 23
        "Loading pari-colors.el from "                ;; no 24
        "### Global Variables : (one per line)"       ;; no 25
        "### Chapter Headings:"                       ;; no 26
        "### Interesting Keywords:"                   ;; no 27
        "Feeling adventurous ? A face name has the shape:\n FaceForForeground/FaceForBackground-[bold,italic]-[underline]\n or simply: FaceForForeground.\n\nFaceFor[Foreground|Background] can be chosen in the following (non-exhaustive) list:\nblack blue brown cyan DarkGoldenrod dimgrey firebrick ForestGreen Goldenrod green grey40 grey50 hex-80a0ff hex-ffff60 lightblue magenta mocassin OliveDrab orange pink Plum purple red RoyalBlue tan yellow white.\n In addition, you can usually add an integer suffix between 1 and 4, like in green3. For instance, you can try the flashy firebrick/yellow-bold. Italic fonts don't show on the screen but are used whenever you get a print-out via the item `Postcript Print Buffer' of the menu-item `Tools'. Finally note here that nil is not the default face... since this default face is simply called `default' !"  ;; no 28
        "A general completion file  containing the name of all the PARI functions is always used. In addition to this file, gp uses a file named your-file-name.cpl when you edit your-file-name. To create this file, you can use the menu-bar item [GP Completion-File Edit-File...] which will create the proper completion-file and introduce the names of the functions and of the global variables of your program. You edit the file by using the item \"Edit File...\" and you can decide to use another completion-file as well through the item \"Use Also File...\"."  ;; no 29
        " Makes the names of functions and global variables of %s available for completion. They will be stored in `%s.cpl' as soon as this file is required for editing. The file `%s.cpl' has the format of a completion file (i.e. a gp-menu file) and is automatically used as a completion file when %s is edited."  ;; no 30
        "Functions or Sections in whose description \"%s\" appears:"  ;;  no 31
        "Subject"                                                     ;;  no 32
        "Name of the completion file: "                               ;;  no 33
        "Could not locate the error."                                 ;;  no 34
        "Probable mistake."                                           ;;  no 35
        (concat "No error to be found or missing buffer (" gp-reads-this-buffer ")") ;; no 36
        "The browser is being build..." ;; no 37
        "Mouse-2 or Return to select an item." ;; no 38
        "The file pariemacs.txt is not in your load-path. You should discover where it is, say in the directory /usr/local/lib/pari/emacs/ and add the line\n (setq load-path (concat load-path \"/usr/local/lib/pari/emacs/\"))\nto your .emacs file (create it if it doesn't already exist)." ;; no 39
        "Use face:"     ;; no 40
        "Called with: %s\n\n"       ;; no 41 
        "Other..."      ;; no 42
        "Colors"        ;; no 43                  http://www.local.attac.org/petition/
        "Update"        ;; no 44 
        "Save"          ;; no 45 
        "Hilit Switch"  ;; no 46 
        "Rehilit All"   ;; no 47 
        "Metakeys"  ;; no 48
        "Read from File..." ;; no 49 
        "Write to File..." ;; no 50 
        "Print in..." ;; no 51 
        "New Prompt" ;; no 52 
        "Simple"         ;; no 53 
        "With Time"   ;; no 54 
        "With Date"             ;; no 55
        "With Separator"        ;; no 56
        "Start GP session"      ;; no 57
        "As Usual"              ;; no 58
        "Change Parameters..."  ;; no 59
        "Run GP on file..."     ;; no 60
        "Run GP in region"      ;; no 61
        "Quit GP session"       ;; no 62
        "Help on this mode"     ;; no 63
        "Completion File"       ;; no 64
        "Use Also File..."      ;; no 65
        "Edit File..."          ;; no 66
        "Make/Update"           ;; no 67
        ""           ;; no 68
        "Name of the GP programm: "  ;; no 69
        "Tutorial Switch"            ;; no 70
        "Previous Setting"           ;; no 71
        "Complete"                   ;; no 72
        "Skip to error"              ;; no 73
        "In/Out..."                  ;; no 74
        "Copy Last Input"            ;; no 75
        "Remove Last Output"         ;; no 76
        "Remove Last Action"         ;; no 77
        "Exchange keys"              ;; no 78
        ))
     (deutsch  .
       ("Using default choice for completion"         ;; no 1
        "Removing %s"
        " Save Colors ? "
        "M-o or ESC-o will remove the help window"
        "PRESS ANY KEY TO CONTINUE..."                ;; no 5
        "done."
        "Waiting for gp output ..."
        "Could not start gp."
        "Incomplete expression : Not sent to gp."     ;; no 9
        "New prompt may lead to an error. Better to set it interactively via M-\\p"
        "Version number %s."                          ;; no 11
        "Tutorial mode activated"                     ;; no 12
        "Tutorial mode desactivated"                  ;; no 13
        "Exchange the bindings of the keys C-p/M-p and C-n/M-n."
        "Waiting for gp completion ..."               ;; no 15
        "C-u M-o to exit editing."                    ;; no 16
        "Starting "                                   ;; no 17
        "SPC=next DEL=previous RET=select s=survey-menu q=quit"
        "Nothing to be selected here"                 ;; no 19
        "Unknown function: %s"                        ;; no 20
        "Function"                                    ;; no 21
        "User Variable: %s"                           ;; no 22
        "No occurence of \"%s\" found."               ;; no 23
        "Loading pari-colors.el from "                ;; no 24
        "### Global Variables : (one per line)"       ;; no 25
        "### Chapter Headings:"                       ;; no 26
        "### Interesting Keywords:"                   ;; no 27
        "Feeling adventurous ? A face name has the shape:\n FaceForForeground/FaceForBackground-[bold,italic]-[underline]\n or simply: FaceForForeground.\n\nFaceFor[Foreground|Background] can be chosen in the following (non-exhaustive) list:\nblack blue brown cyan DarkGoldenrod dimgrey firebrick ForestGreen Goldenrod green grey40 grey50 hex-80a0ff hex-ffff60 lightblue magenta mocassin OliveDrab orange pink Plum purple red RoyalBlue tan yellow white.\n In addition, you can usually add an integer suffix between 1 and 4, like in green3. For instance, you can try the flashy firebrick/yellow-bold. Italic fonts don't show on the screen but are used whenever you get a print-out via the item `Postcript Print Buffer' of the menu-item `Tools'. Finally note here that nil is not the default face... since this default face is simply called `default' !"
        "A general completion file  containing the name of all the PARI functions is always used. In addition to this file, gp uses a file named  your-file-name.cpl  when  you edit your-file-name. To create this file, you can use the menu-bar item [GP Completion-File Edit-File...] which will create the proper completion-file and introduce the names of the functions and of the global variables of your program. You edit the file by using the item \"Edit File...\" and you can decide to use another completion-file as well through the item \"Use Also File...\"."
        " Makes the names of functions and global variables of %s available for completion. They will be stored in `%s.cpl' as soon as this file is required for editing. The file `%s.cpl' has the format of a completion file (i.e. a gp-menu file) and is automatically used as a completion file when %s is edited."
        "Functions or Sections in whose description \"%s\" appears:"  ;;  no 31
        "Subject"
        "Name of the completion file: "
        "Could not locate the error."                                 ;;  no 34
        "Probable mistake."                                 ;;  no 35
        (concat "No error to be found or missing buffer (" gp-reads-this-buffer ")") ;; no 36
        "The browser is being build..." ;; no 37
        "Mouse-2 or Return to select an item." ;; no 38
        "The file pariemacs.txt is not in your load-path. You should discover where it is, say in the directory /usr/local/lib/pari/emacs/ and add the line\n (setq load-path (concat load-path \"/usr/local/lib/pari/emacs/\"))\nto your .emacs file (create it if it doesn't already exist)." ;; no 39
        "Use face:"     ;; no 40
        "Called with: %s\n\n"       ;; no 41 
        "Other..."              ;; no 42
        "Colors"                ;; no 43
        "Update"                ;; no 44 
        "Save"                  ;; no 45 
        "Hilit Switch"          ;; no 46 
        "Rehilit All"           ;; no 47 
        "Metakeys"              ;; no 48
        "Read from File..."     ;; no 49 
        "Write to File..."      ;; no 50 
        "Print in..."           ;; no 51 
        "New Prompt"            ;; no 52 
        "Simple"                ;; no 53 
        "With Time"             ;; no 54 
        "With Date"             ;; no 55
        "With Separator"        ;; no 56
        "Start GP session"      ;; no 57
        "As Usual"              ;; no 58
        "Change Parameters..."  ;; no 59
        "Run GP on file..."     ;; no 60
        "Run GP in region"      ;; no 61
        "Quit GP session"       ;; no 62
        "Help on this mode"     ;; no 63
        "Completion File"       ;; no 64
        "Use Also File..."      ;; no 65
        "Edit File..."          ;; no 66
        "Make/Update"           ;; no 67
        ""           ;; no 68
        "Name of the GP programm: "  ;; no 69
        "Tutorial Switch"            ;; no 70
        "Previous Setting"           ;; no 71
        "Complete"                   ;; no 72
        "Skip to error"              ;; no 73
        "In/Out..."                  ;; no 74
        "Copy Last Input"            ;; no 75
        "Remove Last Output"         ;; no 76
        "Remove Last Action"         ;; no 77
        "Exchange keys"              ;; no 78
))))

;;---------------------------------------
;; PART III : gp-mode AND gp-script-mode
;;---------------------------------------

(defun gp-messager (msg-number)
  (eval (nth msg-number (assq gp-language gp-messages-list))))

(defsubst file-really-exists-p (file)
  (and (not (string= file "")) (file-exists-p file)))

(defsubst gp-kill-buffer-safely (abuffer)
  (let ((b (get-buffer abuffer)))
       (if b (kill-buffer b))))

(defsubst gp-get-beginning-of-line nil
  (save-excursion (beginning-of-line) (point)))

(defsubst gp-get-end-of-line nil
  (save-excursion (end-of-line) (point)))

(defun gp-choose-complete nil
  "Try to see whether readline is enabled or not
and select proper completion function. To be used
when the buffer *PARI* is selected."
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "readline .*\\(dis\\|en\\)abled" nil t)
      (progn
        (forward-char -6)
        (setq gp-readline-enabledp (looking-at "n")))
    ;; Else use default:
      (message (gp-messager 1)))))

(defsubst gp-learn-sexp nil
  "To teach emacs some elements of gp-syntax."
  ;; Treat comments as white spaces in sexp:
  (make-local-variable 'parse-sexp-ignore-comments)
  (setq parse-sexp-ignore-comments t)
  ;; Care about capital or not (always local):
  (setq case-fold-search nil)
  ;; Comments in sexp (We handle only one kind of comments):
  (make-local-variable 'comment-start)
  (setq comment-start "\\\\")  ;; A *string*, NOT a regexp.
  (make-local-variable 'comment-end)
  (setq comment-end "")
  (make-local-variable 'comment-start-skip)
  (setq comment-start-skip "\\\\\\\\.*$\\|/\\*\\([^\\*]\\|\\*[^/]\\)*\\*/"))

(defun pari-mode ()
  "Common part of 'gp-mode and 'gp-script-mode"
  ;; In case pari-colors has not been set in the user's hook
  ;; and the installation is on a network:
  (or (file-writable-p pari-colors)
      (setq pari-colors "~/pari-colors.el"))
  (gp-hilit-init)                  ;; Hilit some chosen patterns.

  (if gp-menu-loadedp nil
    (gp-cpl-init)
    (setq gp-menu-loadedp t))
      ;; Make the default completion array.

  (if (file-really-exists-p (concat (buffer-name) ".cpl"))
      ;; The local completion for this file.
      (gp-cpl-file (concat (buffer-name) ".cpl")))

  (if (file-really-exists-p gp-additional-cpl-file)
     ;; Add this file to the usual completion array.
      (gp-cpl-file gp-additional-cpl-file))
  (gp-learn-sexp)
  (set-syntax-table gp-syntax-table))

;; The line ";;;###autoload" is useless.
;; It will be useful when pari.el will be part
;; of the usual distribution of emacs.
;;;###autoload
(defun gp-script-mode nil
  "Major mode for editing GP input files.

The following bindings are available:
\\{gp-script-map}"

  (interactive)
  (setq major-mode 'gp-script-mode mode-name "GP script")
  (run-hooks 'pari-mode-hook)
  (run-hooks 'gp-script-mode-hook) ; Set up user preferences.
  (pari-mode)
  (use-local-map gp-script-map)
  ;; Make gp-script-map the local map in this mode.
  (gp-init-script-menu-bar)         ; Start menu-bar.
  )

;; The line ";;;###autoload" is useless.
;; It will be useful when pari.el will be part
;; of the usual distribution of emacs.
;;;###autoload
(defun gp-mode ()
  "Major mode for running a gp-process.

The following bindings are available:
\\{gp-map}"

  (interactive)
  (setq major-mode 'gp-mode mode-name "GP")
  (run-hooks 'pari-mode-hook)
  (run-hooks 'gp-mode-hook) ; Set up user preferences.
  (pari-mode)
  (use-local-map gp-map)    ; Make gp-map the local map of buffer *PARI*.
  (gp-choose-complete)      ; Try to decide whether readline is enabled.
  (gp-init-menu-bar)        ; Start menu-bar.
  )

(defsubst gp-clear-temp-files nil
  "Remove temporary files that may have been created" 
   (if (file-exists-p gp-temp-file)
       (progn (delete-file gp-temp-file) 
              (message (gp-messager 2) gp-temp-file)))
   (if (file-exists-p gp-el-temp-file) 
       (progn (delete-file gp-el-temp-file) 
              (message (gp-messager 2) gp-el-temp-file))))

(defun gp-save-setting-kill-emacs nil
  "Ask whether to save the choice of colors if need be
and remove temporary files."
  (and pari-colors-modifiedp (y-or-n-p (gp-messager 3))
       (gp-save-colors))
  (gp-clear-temp-files))

(make-local-hook 'kill-emacs-hook)
(setq kill-emacs-hook (function gp-save-setting-kill-emacs))

(defun gp-displace-input nil
  (if (and (save-excursion (re-search-forward gp-prompt-pattern nil t))
           (save-excursion (re-search-backward gp-prompt-pattern nil t)))
      (let ((where (point)))
        (re-search-backward gp-prompt-pattern nil t)
        (goto-char (match-end 0))
        (setq where (- where (point)))
        (gp-copy-input)
        (re-search-backward gp-prompt-pattern nil t)
        (goto-char (+ where (match-end 0))))))

(defun gp-locked-self-insert-command nil
  (interactive)
  (gp-displace-input)
  (insert-char last-command-char 1))

(defun gp-locked-mouse-2 (anevent)
  (interactive "e")
  (mouse-set-point anevent)
  (gp-displace-input)
  (yank))

(defun gp-locked-yank nil
  (interactive)
  (gp-displace-input)
  (yank))

(defun gp-locked-backward-delete-char-untabify nil
  (interactive)
  (gp-displace-input)
  (backward-delete-char-untabify 1))

;;-----------------------------
;; PART IV : GENERAL FUNCTIONS
;;-----------------------------

;;--------------------------
;; HANDLING THE WINDOWS ...
;;--------------------------
;; At the beginning, the user has asked for one window, but s/he may well
;; have introduced another window in-between (or even several ones).
;; We should then use only one other fixed window for everything else.
;; But since the list of the buffers displayed in a window does not exist,
;; and since the user may well change of window by ITself, we can't do much.


(defsubst gp-depile-wind-conf nil
  (setq gp-registers-list (cdr gp-registers-list)))

(defsubst gp-backward-wind-conf nil
  "Restore previously stored window configuration."
 (if (not (equal gp-registers-list nil))
     (progn
       (jump-to-register (car gp-registers-list))
       (setq gp-registers-list (cdr gp-registers-list)))))

(defsubst gp-store-wind-conf nil
  "Add a the current window configuration to the pile. If the pile
has more than 'gp-max-saved-wind-conf items
(0,1,...,(1- gp-max-saved-wind-conf)) then the first item is lost."
  (if (= (length gp-registers-list) gp-max-saved-wind-conf)
      (setq gp-registers-list (nreverse (cdr (nreverse gp-registers-list)))))
  (let ((next (if (equal gp-registers-list nil) 0
                  (if (= (car gp-registers-list) (1- gp-max-saved-wind-conf)) 0
                      (1+ (car gp-registers-list))))))
       (window-configuration-to-register next)
       (setq gp-registers-list (cons next gp-registers-list))))

(defun gp-restore-wind-conf (&optional arg)
  "Restore the previous window-configuration, killing the *gp-help* buffer
if it was and is no more displayed. When called with prefix ^U, end the
edition of the completion-file (if any were edited)."
  (interactive "P")
  (if (and arg (= (car arg) 4)) ;; Meaning that the call has been C-u M-o
      (gp-quit-cpl-edit)
      (let ((had-help-windowp (and (get-buffer "*gp-help*")
                                   (get-buffer-window "*gp-help*")))
            (had-message-windowp (and (get-buffer "*gp-messages*")
                                      (get-buffer-window "*gp-messages*"))))
           (gp-backward-wind-conf)
           ;; Kill the buffer *gp-help* if it is not displayed anymore:
           (if had-help-windowp
             (if (not (get-buffer-window "*gp-help*"))
                 (kill-buffer "*gp-help*")))
           (if had-message-windowp
             (if (not (get-buffer-window "*gp-messages*"))
                 (kill-buffer "*gp-messages*"))))
      ;; When called from menu-bar, write nothing in the minibuffer:
      (message "")))

(defsubst gp-info-wind-conf nil (message (gp-messager 4)))

(defun buffer-visiblep (abuffer-name)
  (if (get-buffer-window abuffer-name) t nil))

(defun name-extension (filename)
  "Return the extension suffix of filename, if any"
  (if (> (length filename) (length (file-name-sans-extension filename)))
      (substring filename (1+ (length (file-name-sans-extension filename))))
      ""))

(defun gp-proper-name (filename)
  "We replace the dots in filename by -."
  (setq filename (file-name-nondirectory filename))
  (let ((ll (length filename)) (pos 0))
       (while (< pos ll)
              (if (= (aref filename pos) ?.)
                  (aset filename pos ?-))
              (setq pos (1+ pos)))
       filename))

(defsubst gp-pgrmp (abuffer)
  "Return t if buffer abuffer is in gp-script-mode."
  (set-buffer abuffer) (eq major-mode 'gp-script-mode))

(defsubst gp-possible-file-name nil
  "Try to guess the name of a likely gp-program."
  ;; First tries the existing windows, then the existing buffers.
  (let ((pgrm nil))
       (walk-windows
         (lambda (wind)
          (if (gp-pgrmp (window-buffer wind))
              (setq pgrm
                 (cons (buffer-name (window-buffer wind)) pgrm)))))
       (if pgrm (car pgrm) ; Return value if a window is displaying
                           ; a candidate gp-program.
           (mapcar
             (lambda (abuffer)
              (if (gp-pgrmp abuffer)
                  (setq pgrm (cons (buffer-name abuffer) pgrm))))
             (buffer-list))
           (if pgrm (car pgrm) ; Return value if a buffer is
                               ; candidate gp-program.
                    nil        ; Return value if fail.
   ))))

(defun gp-window-manager (my-buffer-name option)
"Takes care of the windows in gp-mode and gp-script-mode.
Displays the buffer MY-BUFFER-NAME in a proper window.
The variable OPTION is
  -- gp-beginning when we handle the beginning of a procedure. If a buffer
                  already exists with this name, only store the wind-conf.
  -- gp-beginning-temp when we handle the beginning of a procedure. If a
                       buffer already exists with this name, store it.
  -- gp-remove-help-now to remove help-window,
  -- gp-remove-help-old-config to wait and remove help-window without
                               touching to the other windows.
  -- gp-remove-help-now-old-config to remove help-window without
                               touching to the other windows.
  -- gp-show-help which is similar to gp-beginning for the help buffer
                  except that we do not erase the content of this buffer.
  -- nil when it is the end of a call.
The variable MY-BUFFER-NAME is one of 
\"*PARI*\"  \"*gp-help*\" \"*gp-menu*\". "

  (cond ((and (string= my-buffer-name "*PARI*")
              (eq option 'gp-beginning)
              (get-buffer-window "*PARI*"))
         ;; We go to *PARI* and a window already exists with this buffer.
         (gp-store-wind-conf)
         (select-window (get-buffer-window "*PARI*")))
        
        ((and (string= my-buffer-name "*PARI*")
              (eq option 'gp-beginning)
              (not (get-buffer-window "*PARI*")))
         ;; We go to *PARI* and a window doesn't exist with this buffer.
         (if (= (count-windows) 1)
             ;; If there is only one window which contains anything but scratch ;a gp-program,
             ;; split the window in 2, else use this window:
             (progn (if (not (string= (buffer-name) "*scratch*")) ;;(gp-pgrmp (window-buffer))
                        (select-window (split-window-vertically)))
                    (switch-to-buffer "*PARI*"))
             ;; At least two windows exist. Do not create another one
             ;; and first try to use the help window, else the
             ;; starting window.
             (gp-store-wind-conf)
             (cond ((get-buffer-window "*gp-help*")
                    (select-window (get-buffer-window "*gp-help*"))
                    (switch-to-buffer "*PARI*"))
                   (t (switch-to-buffer-other-window "*PARI*")))))

        ((and (string= my-buffer-name "*PARI*")
              (not option)
              (get-buffer "*PARI*"))
         ;; We want to exit from *PARI*.
         (if (> (count-windows) 1)
             (delete-windows-on "*PARI*")
             ;; Else only one window.
             (if (string= (buffer-name (window-buffer)) "*PARI*")
                 ;; This only window displays "*PARI*"
                 (let ((next-buffer (gp-possible-file-name)))
                      (if next-buffer (switch-to-buffer next-buffer)
                          ;; Else, don't know what to do !
                          (gp-restore-wind-conf)
                          ))))
         (or gp-keep-PARI-buffer-when-quitting
             (kill-buffer "*PARI*")))

        ((and (get-buffer my-buffer-name)
              (member my-buffer-name '("*gp-help*" "*gp-menu*"))
              (eq option 'gp-remove-help-now)
              (get-buffer-window my-buffer-name))
         ;; A buffer displaying "*gp-help*" or "*gp-menu*" exists.
         ;; We want to remove the message.
         (if (or (string= my-buffer-name "*gp-help*")
                 (not (get-buffer "*gp-help*")))
             ;; Exit from help or the gp-menu is alone:
             (gp-restore-wind-conf)
             (if (string= my-buffer-name "*gp-menu*")
             ;; The previous condition should always be verified!
             ;; We should remove the window displaying gp-menu:
                 (progn
                   (if (and (= (count-windows) 2)
                            (get-buffer "*gp-help*"))
                       (progn
                         (gp-depile-wind-conf)
                         (switch-to-buffer "*gp-help*")
                         (other-window 1))
                       (gp-restore-wind-conf)))))
         ;; We have to kill the buffer (in any case) and select
         ;; a proper buffer for this window in case this killing
         ;; made something weird appear:
         (gp-kill-buffer-safely my-buffer-name)
         ;; since it may have been destroyed by 'gp-restore-wind-conf.
         (let ((buffer-to-select ""))
              (save-excursion
               (let ((abufferlist (buffer-list)))
                    (while (and (string= buffer-to-select "")
                                abufferlist)
                      (set-buffer (car abufferlist))
                      (if (memq major-mode '(gp-script-mode gp-mode))
                          (setq buffer-to-select (buffer-name)))
                      (setq abufferlist (cdr abufferlist)))))
              ;; Last weird case to handle: the buffer we have selected
              ;; is already being shown on another window.
              ;; Then kill our window.
              (if nil ;(buffer-visiblep buffer-to-select)
                  (delete-window)
                  (or (string= buffer-to-select "") ;; Let it be !
                      (switch-to-buffer buffer-to-select)))))

        ((and (get-buffer my-buffer-name)
              (member my-buffer-name '("*gp-help*" "*gp-menu*"))
              (memq option '(gp-remove-help-old-config
                             gp-remove-help-now-old-config)))
         ;; A buffer displaying "*gp-help*" or gp-menu exists.
         ;; We want to remove the message without touching
         ;; to the window-configuration.
         (cond ((eq option 'gp-remove-help-old-config)
                (message (gp-messager 5))
                (read-event)))
         (kill-buffer my-buffer-name))

        ((and (string= my-buffer-name "*gp-help*")
              (memq option '(gp-beginning gp-show-help))
              (get-buffer-window "*gp-help*"))
         ;; We go to *gp-help* and a window already exists with this buffer.
         (select-window (get-buffer-window "*gp-help*"))
         (or (eq option 'gp-show-help) (erase-buffer)))

        ((and (string= my-buffer-name "*gp-help*")
              (eq option 'gp-beginning-temp)
              (get-buffer-window "*gp-help*"))
         ;; We go temporarily to *gp-help* and a window already exists with
         ;; this buffer.
         (gp-store-wind-conf)
         (select-window (get-buffer-window "*gp-help*"))
         (erase-buffer))

        ((and (get-buffer my-buffer-name)
              (member my-buffer-name '("*gp-help*" "*gp-menu*"))
              (eq option 'gp-remove-help-now))
         ;; Since it got here, my-buffer-name is not displayed.
         (gp-kill-buffer-safely my-buffer-name))

        ((and (string= my-buffer-name "*gp-help*")
              (memq option '(gp-beginning gp-beginning-temp gp-show-help))
              (not (get-buffer-window "*gp-help*")))
         ;; We go to *gp-help* and a window doesn't exist with this buffer.
         (gp-store-wind-conf)
         (if (= (count-windows) 1)
             (progn (select-window (split-window-vertically))
                    (switch-to-buffer "*gp-help*"))
             (cond ((and (get-buffer-window "*PARI*")
                     (not (eq (get-buffer-window "*PARI*") (selected-window))))
                    (select-window (get-buffer-window "*PARI*"))
                    (switch-to-buffer "*gp-help*"))
                   (t (switch-to-buffer-other-window "*gp-help*"))))
         (or (eq option 'gp-show-help) (erase-buffer)))

        ((and (string= my-buffer-name "*gp-menu*")
              (eq option 'gp-beginning))
         ;; We go to gp-menu.
              (if (get-buffer "*gp-menu*")
                  ;; A gp-menu already exists. Kill it first:
                  (save-excursion
                    (set-buffer "*gp-menu*")
                    (gp-menu-quit)))
              (gp-store-wind-conf)
              (if (get-buffer-window "*gp-help*")
                  (progn
                    (select-window (get-buffer-window "*gp-help*"))
                    (switch-to-buffer
                       (get-buffer-create "*gp-menu*"))
                    (kill-buffer "*gp-help*"))
                  (if (= (count-windows) 1)
                      (split-window-vertically))
                  (switch-to-buffer-other-window
                    (get-buffer-create "*gp-menu*"))))
))  ; end of 'gp-window-manager

;;----------------
;; THE GP PROCESS
;;----------------

(defsubst gp-make-gp-prompt-pattern (a-pattern)
  "Add regexp a-pattern at beginning of line and followed by any
amount of space/tab/newline to gp-prompt-pattern."
;; gp-prompt-pattern matches:
;; (New prompt plus any following white space) OR (Old pattern).
  (setq gp-prompt-pattern
    (concat "^" a-pattern "[\n\t ]*\\|" gp-prompt-pattern)))

(defsubst gp-beginning-of-last-line nil
  (goto-char (point-max))
  (re-search-backward gp-prompt-pattern)
  (goto-char (match-end 0)))

(defsubst gp-wait-for-output (point-init &optional nomessage process initialp)
"Hang around until the prompt appears.
PROCESS defaults to gp-process."
  (let ((notdone t))
  (or process (setq process gp-process))
  (while notdone
    ;; Wait till something comes out:
    (while (and (not (accept-process-output process 0 300))
                (not (= point-init (point)))
                ;; Following line is required for the \q command:
                (eq 'run (process-status process))))
    (let ((p (point)))
      (if (or
            ;; Following lines are required for the \q command:
	    (not (and (processp process) 
		      (eq 'run (process-status process))))
            (save-excursion
              (if (re-search-backward gp-prompt-pattern nil t)
                  (= (match-end 0) (point-max))
                  nil)))
  ;; If gp is not running, or the prompt has appeared, stop.
	(progn (or nomessage (message (gp-messager 6)))
               (setq notdone nil))
  ;; Else flush the buffer and wait a bit longer.
	(progn (or nomessage (message (gp-messager 7)))))
      (goto-char p))))
    (sit-for 0))

(defun gp-get-shell (process-name process-buffer-name cmd)
    "Explicit. Distinguishes bash/sh and [t]csh. Aimed at command gp+parameters."
  ;; We put the number of lines to 1000 so that no break will
  ;; occur when giving long comment like with "?6". We do not
  ;; want any "Return to continue", the editing job should
  ;; be done by emacs and not by gp.
  (if (member (file-name-nondirectory shell-file-name) '("bash" "sh"))
      (start-process process-name process-buffer-name
                 shell-file-name "-c"
                 (concat "(TERM=emacs; LINES=1000; COLUMNS="
                         (number-to-string (window-width))
                         "; export TERM COLUMNS LINES; " cmd ")"))
      (start-process process-name process-buffer-name
                 shell-file-name "-c" ; .../[t]csh is the shell!
                 (concat "stty -echo nl; env TERM=emacs LINES=1000 COLUMNS="
                      (number-to-string (window-width)) " "
                    cmd))))

(defun gp-call-gphelp (win-size word output-buffer opt)
  "Explicit. Distinguishes bash/sh and [t]csh."
  (if (member (file-name-nondirectory shell-file-name) '("bash" "sh"))
    (shell-command
      (concat "(export COLUMNS=" (number-to-string win-size) ";"
                gp-gphelp-dir "gphelp " opt " \"" word "\";)") output-buffer)
    (shell-command
      (concat "setenv COLUMNS " (number-to-string win-size) ";"
                gp-gphelp-dir "gphelp " opt " \"" word "\"") output-buffer)))

(defmacro gp-background (flag)
  "Same as 'gp except that it doesn't switch to the buffer `*PARI*'.
The answer is t if success, and nil otherwise."
 (` (save-excursion
  (if (and (processp gp-process)
           (eq 'run (process-status gp-process)))
    t ; If gp is already running, do nothing.

;; Else start up gp in the buffer.

    ;; Create the buffer `*PARI*' if required.
    (set-buffer (get-buffer-create "*PARI*"))
    (erase-buffer)
;; Form the command line string.
    (run-hooks 'pari-mode-hook 'gp-mode-hook)
    (let*((process-connection-type t) ; use PTY.
          (flag (or (, flag) gp-prompt-for-args))
          (gp-cmd
           (concat
             (gp-read-input "Gp executable ?" gp-file-name "" flag)
             (gp-read-input "Stack size ?" (number-to-string gp-stack-size)
                            " -s " flag)
	     (gp-read-input "Prime limit ?" (number-to-string gp-prime-limit)
                            " -p " flag)
	     " -emacs"  ; -emacs requested by gp2.
             )))
 
;; Insert the command line string into the *PARI* buffer (for reference)
      (insert (format (gp-messager 41) gp-cmd)) ;(concat "Called with: " gp-cmd "\n\n"))
;; Start gp.
      (setq gp-process (gp-get-shell "pari" "*PARI*" gp-cmd))
;; Clean up when the gp process has finished.
    (set-process-sentinel gp-process (function gp-sentinel)))
    ;; We should run the hook as the prompt may have
    ;; been changed in the .gprc:
    (run-hooks 'pari-mode-hook)
    (gp-wait-for-output (point-min))
    (setq gp-input-start (point) gp-input-end (point))
    ;; Introduce 'gp-mode
    ;; (Should be here as the prompt needs a gp-session running,
    ;; as well as the choice readline on/off):
    (if (eq major-mode 'gp-mode) nil (gp-mode))
    (setq mode-line-process '(": %s"))
    (if (memq (process-status gp-process) '(signal exit))
        (setq gp-process nil) t)))))

(defun gp (flag)
  "
   Open a buffer and a window for the execution of gp.

   The following bindings are available:
   \\{gp-map}

  The variables
  gp-file-name gp-stack-size gp-prime-limit
  determine the command line that starts gp.
  To override the default settings, give gp a prefix argument.
  C-u M-x gp ."

  (interactive "P")
  (if (gp-background flag)
      (progn
        (gp-window-manager "*PARI*" 'gp-beginning)
        ;; Hilight first prompt:
        (goto-char (point-max))
        (gp-update-hilit))
      (message (gp-messager 8))))

(defun gp-run-in-region (beg end)
  "Run GP on the current region.  A temporary file (gp-temp-file) is
written in gp-temp-directory, but GP is run in the current directory."
;; Set gp-input-start, gp-input-end and gp-reads-this-buffer.
   (interactive "r")
   (setq gp-input-start beg gp-input-end end)
   (setq gp-reads-this-buffer (buffer-name))
   (gp-input-filter)
   (write-region beg end gp-temp-file nil nil)
   (gp nil)     ;; In case a GP-process was not already running, starts one.
                ;; In any case, switches to buffer "*PARI*".
   (gp-beginning-of-last-line)
   (insert (concat "\\r " gp-temp-file))
   (set-marker (process-mark gp-process) (point))
   (gp-send-input))

(defun gp-read-input (prompt default sep flag)
  "If flag is non-nil, reads string (if string is \"\" uses default).
Else, if flag is nil, set string to default.
If resulting string is not \"\" prepends sep.
As a special case, if string is \" \", return \"\"."

  (let ((string
    (if flag
;; If flag is non-nil prompt for input from mini-buffer.
      (read-input
        (concat prompt " (Default "default") "))
;; Else use the default string.
        default)))

    (if (equal string "")
      (if (equal default "") 
         ""                     ;; If string and default both "": 
         (concat sep default))  ;; If string "" and default is non empty:
      (if (equal string " ")
        ""                      ;; If string is a space:
        (concat sep string))))) ;; If string is non empty:

(defun gp-sentinel (proc msg)
  "Sentinel for the gp-process in buffer *PARI*."

  (gp-kill-buffer-safely "*gp-menu*")
  (gp-window-manager "*gp-help*" 'gp-remove-help-now)
      ;; We do not kill the buffer "*Completions*" as it may have
      ;; been triggered by something else.
  (gp-window-manager "*PARI*" nil)
  (gp-clear-temp-files)
  (setq gp-process nil))

(defun gp-output-filter ()
  (let ((wind (selected-window))
        (errp (save-excursion
                (goto-char (1+ gp-input-end))
                (looking-at "^  \\*\\*\\*  \\|^Unknown function"))))
      (if errp
       	(progn
	  (let ((copy (buffer-substring (1+ gp-input-end)
                       (progn
                         (goto-char (point-max)) ;; We should already be there!
                         ;; Remove last prompt line ...
	                 (beginning-of-line)
                         ;; and final empty lines:
                         (skip-chars-backward " \t\n")
                         (point)))))
            (delete-region gp-input-end (point-max))
            (gp-store-wind-conf)
            (other-window 1)
	    (split-window-vertically)
            ;(other-window 1)
            (switch-to-buffer (get-buffer-create "*gp-messages*"))
	    (erase-buffer)
	    (insert copy)
            (shrink-window-if-larger-than-buffer)
	    (goto-char (point-min))
            (gp-info-wind-conf)
	    (select-window wind))))))

(defsubst gp-frame-parameter (frame parameter)
  (if old-emacs-versionp
    (cond ((eq parameter 'cursor-color) "black")
          ((eq parameter 'background-color) "blue")
          ((eq parameter 'font) (nth 1 (assoc "Default" (assoc "Misc" x-fixed-font-alist))))
          (t nil))
    (frame-parameter frame parameter)))

(defun gp-special-output-filter nil
  (let ((errp (save-excursion
                (goto-char (1+ gp-input-end))
                (or (looking-at "^  \\*\\*\\*   unexpected character: \\.\\.\\.")
                    (looking-at "^  \\*\\*\\*   expected character: [^\n]*\n  \\*\\*\\*   instead of: ")
                    (looking-at "^  \\*\\*\\*   expected character: [^\n]*\n  \\*\\*\\*   instead of:\n  \\*\\*\\*   \\.\\.\\.")
                    (looking-at "^  \\*\\*\\*   unknown function or error in formal parameters:\n  \\*\\*\\*   \\.\\.\\.") 
                    (looking-at "^  \\*\\*\\*   unexpected character: "))
                )))
      (if errp  ;; T if an error has been detected.
       	(progn
          (goto-char (match-end 0))
	  (let* (;; the line containing the mistake:
                 (astring (buffer-substring (point)
                                            (progn (end-of-line) (point))))
                 ;; how many characters of astring have been sent to
                 ;; gp-latest-error:
                 (place 1)
                 ;; "location" of the mistake:
                 (which-char (+ (length astring) (- (search-forward "^")
                                                    (progn (end-of-line) (point))))))
            ;; We create gp-latest-error:
           (setq gp-latest-error (concat "\\(" (regexp-quote (substring astring 0 1))))
            (while (< place (length astring))
              (setq gp-latest-error
                    (concat gp-latest-error "[ \t\n]*\\(\\(/\\*[^\\*]*\\*/\\|\\\\\\.*$\\)[ \t\n]*\\)*"
                            (regexp-quote (substring astring place (setq place (1+ place))))))
              (if (= place which-char)
                  (setq gp-latest-error (concat gp-latest-error "\\)"))))
            (select-window (get-buffer-window gp-reads-this-buffer))
            (goto-char (point-min))
            (gp-skip-to-error))))))

(defun gp-skip-to-error nil
  (interactive)

  (if (and gp-reads-this-buffer gp-latest-error
           (buffer-live-p (get-buffer gp-reads-this-buffer)))
    (progn
      (if (string= (buffer-name) gp-reads-this-buffer) nil
          (switch-to-buffer gp-reads-this-buffer)
          (goto-char (point-min)))
      (if (re-search-forward gp-latest-error nil t)
          (progn (goto-char (1- (match-end 1)))
                 ;; Warn the user this place is maybe not the good one !:
                 (message (gp-messager 35))
                 ;; Make the cursor blink:
                 (let ((old-color (gp-frame-parameter nil 'cursor-color))
                       ;; Does not work... Why ? :
                       (other-color (gp-frame-parameter nil 'background-color))
                       (how-many 6) (how-long-dark 50) (how-long-light 70) aux)
                       ;; The lighter color should stay longer. In case of a dark background
                       ;; exchange the times:
                       (if (eq hilit-background-mode 'dark)
                           (progn (setq aux how-long-light)
                                  (setq how-long-light how-long-dark)
                                  (setq how-long-dark aux)))
                       (setq other-color "blue")
                       (while (> how-many 0)
                         (set-cursor-color other-color)
                         (sit-for 0 how-long-light)
                         (set-cursor-color old-color)
                         (sit-for 0 how-long-dark)
                         (setq how-many (1- how-many)))
                       (set-cursor-color other-color)
                       (sit-for 0 how-long-light)
                       (set-cursor-color old-color)))
          ;; Could not locate the error:
          (message (gp-messager 34))))
    (message (gp-messager 36))))

(defun gp-usual-start nil
  "Start a GP session."
  (interactive)
  (gp nil)  ;; In case a GP-process was not already running, starts one.
            ;; In any case, switch to buffer "*PARI*". 
  )

(defun gp-start-with-parameters nil
  "Start a GP session."
  (interactive)
  (gp t)    ; In case a GP-process was not already running, starts one.
            ; In any case, switch to buffer "*PARI*". 
  )

(defun run-gp nil
  "Sends a file to be run under GP."
  ;; This command is simply a compositum of 'gp-usual-start
  ;; and 'gp-meta-r. However the default file is different.
   (interactive)
   (let* ((gp-pgrm (gp-read-input (gp-messager 69)
                                  (gp-possible-file-name) "" t)))
         (if (get-buffer gp-pgrm)
             (save-excursion
               (set-buffer gp-pgrm)
               (setq gp-reads-this-buffer gp-pgrm)
               (if (buffer-modified-p) (save-buffer))
               (setq gp-input-start (point-min)
                     gp-input-end (point-max))
               (gp-input-filter)
               ;; In case 'gp-input-filter modified the buffer:
               (setq gp-pgrm (buffer-file-name))
               (if (buffer-modified-p) (save-buffer 0))))
         (gp nil)  ;; In case a GP-process was not already running, starts one.
                   ;; In any case, switches to buffer "*PARI*". 
         (gp-beginning-of-last-line)
         (insert (concat "\\r " gp-pgrm))
         (set-marker (process-mark gp-process) (point))
         (gp-send-input)))

(defun gp-C-j nil
  (interactive)
  (insert-char ?\n 1)
  (put-text-property (1- (point)) (point) 'gp-virtual-newline t))

(defsubst gp-is-virtual (where)
  (get-text-property where 'gp-virtual-newline))

(defsubst gp-end-of-inputp nil
  ;; Beware we do not impose the initial point to be at end of line !!
  (save-excursion
    (forward-char -1)
    (and (not (and (looking-at "\n")
                   (gp-is-virtual (point))))
         (not (and (looking-at "\n")
                   (save-excursion
                     (forward-char -1)
                     (looking-at "\\\\"))))
         (not (looking-at "\\\\")))))

(defun gp-find-end-of-input (end)
  "Gives the position of next end-of-input and nil if none."
  (save-excursion
    (while (and (re-search-forward "\n" end t)
                (not (gp-end-of-inputp))))
    (if (and (char-equal (char-after (1- (point))) ?\n)
             (gp-end-of-inputp))
        (point)
        ;; No more newlines in sight:
        (goto-char (point-max))
        (if (gp-end-of-inputp) (point) nil))))

(defun gp-copy-input (&optional nocontrol)
  "Copy expression around point to the end of the buffer.
(Unless this is already the last expression.)
  If NOCONTROL is non nil, then 'gp-complete-expression is
automatically set to t and emacs will not check whether the
expression is complete or not."

  (interactive)
;; Go back to the end of prompt, and record that point.
  (re-search-backward gp-prompt-pattern)
  (goto-char (setq gp-input-start (match-end 0)))  ;; end of prompt
  (setq gp-input-start-bracketp (looking-at "[ \t]*{"))

  (let ((lastp t))  ;; t if this input is ths last one
                    ;; (i.e. is not followed by a prompt).
    (if gp-input-start-bracketp
      (progn
        (save-excursion
          (if (re-search-forward "}" nil t)
              (setq gp-input-end (point))
              (setq gp-input-end nil)))
        (setq lastp (not (re-search-forward gp-prompt-pattern nil t)))
        (if (or (and (not lastp) gp-input-end
                     (< (match-beginning 0) gp-input-end))
                (not gp-input-end))
            ;; Bad or unfinished construct:
            (progn
              (if lastp
                ;; Repair the \n:
                (progn
                  (goto-char gp-input-start)
                  (while (search-forward "\n" nil t)
                    (put-text-property (1- (point)) (point)
                                       'gp-virtual-newline t)))
                (setq gp-input-end (match-beginning 0)))
              (setq gp-input-start-bracketp nil)))))

    (if gp-input-start-bracketp ;; properly enclosed expression.
      (setq gp-complete-expression t)

      (setq gp-input-end (gp-find-end-of-input (point-max)))
      (if gp-input-end
        (setq gp-complete-expression t)
        (goto-char (point-max))
        (setq gp-input-end (point-max))
        (setq gp-complete-expression (gp-end-of-inputp)))

      (setq lastp (equal gp-input-end (point-max)))
      (if (not lastp)
        ;; It is not the last expression:
        (setq gp-input-end (1- gp-input-end)))
      ;; Remove trailing (virtual) \n :
      (if (char-equal (char-after (1- gp-input-end)) ?\n)
        (progn
           (goto-char gp-input-end)
           (re-search-backward "[^\n]\\(\n\\)" gp-input-start t)
           (setq gp-input-end (match-beginning 1))
           (goto-char gp-input-end)
           (put-text-property (point) (1+ (point)) 'gp-virtual-newline nil)
           (setq gp-complete-expression (gp-end-of-inputp))))

      ;; We refine 'gp-complete-expression:
      (let ((ans (parse-partial-sexp gp-input-start gp-input-end)) a-pt)
          (setq gp-complete-expression
              (or nocontrol
                (and gp-complete-expression
                     (equal (nth 0 ans) 0)  ; Depth in parens is 0.
                     (not (nth 3 ans))      ; Not inside a string.
                     (or (not (nth 4 ans))  ; Not inside a comment...
                         (nth 7 ans))       ; except if it starts with \\.
                     )))))

    (goto-char (point-max))
    (if (not lastp)
     ;; It is not the last expression:
     (progn
       (insert (buffer-substring gp-input-start gp-input-end))
       (if gp-complete-expression
         nil
         (ding)
         (message (gp-messager 9)))))))

(defun gp-input-filter nil
  "Look at buffer between gp-input-start and gp-input-end.
-- If it finds a string `default(prompt,foo)', and
foo is a gp-string, try to set gp-prompt-pattern
correctly. If foo is not a string, warn the user that
something wrong may happen.
-- If a line `\\@' is found, set variable 'gp-should-wait-for-ouputp
to nil.
-- If a comment `/* */' starts by a @, the content is understood
as a Lisp command and appended to the file gp-el-temp-file. This
file is empty at the beginning. This file is loaded before execution
of the gp program."
  ;; Follow 'gp-copy-input so the input has been copied at the end
  ;; of the buffer. 'gp-input-start and 'gp-input-end are set.
  (interactive)
  (save-excursion

   ;; Take care of `/*@ foo */':
   (goto-char gp-input-start)
   (let ((first-time t))
     (while (re-search-forward "/\\*@\\(\\([^\\*]\\|\\*[^/]\\)*\\)\\*/" gp-input-end t)
       (if first-time
         (progn (setq first-time nil)
                (if (file-exists-p gp-el-temp-file)
                    ;; Remove any older version:
                    (delete-file gp-el-temp-file))))
       ;; Append the Lisp part to the file "gp-prgm":
       (write-region (match-beginning 1) (match-end 1)  gp-el-temp-file t)
       (write-region "\n" nil gp-el-temp-file t)
       (goto-char (match-end 0)))
     (if first-time nil
         ;; Load the Lisp part:
         (load-file gp-el-temp-file))))

   ;; Run filter hooks if any. It should be here since the hook
   ;; may have been defined precisely in this file.
   ;; Should not be surrounded by a save-excursion !
   (run-hooks 'gp-input-filter-hook)

 (save-excursion
   ;; Warn the user that `default(prompt,APROMPT)' may not work properly.
   (goto-char gp-input-start)
   (while (re-search-forward "default(prompt," gp-input-end t)
     ;; Try to set the prompt if it is a simple string.
     (goto-char (match-end 0))
     (let ((start (1+ (match-end 0))))
       (if (and (looking-at "[ ]*\"")
                (re-search-forward "\")" gp-input-end t))
           (gp-make-gp-prompt-pattern
              (gp-make-prompt-pattern
                (buffer-substring start (- (match-end 0) 2))))
           ;; Else troubles...
           (message (gp-messager 10))
           (sit-for 2))))

   ;; Take care of `\\@':
   (goto-char gp-input-start)
   (if (re-search-forward "^\\\\\\\\@$" gp-input-end t)
       (setq gp-should-wait-for-outputp nil))

   ;; Take care of virtual-newlines:
   (goto-char gp-input-start)
   (while (re-search-forward "[^\\\\]\\(\n\\)" gp-input-end t)
     (if (gp-is-virtual (1- (point)))
         (progn
           (replace-match "\\\n" t t nil 1)
           (forward-char -1)
           (setq gp-input-end (1+ gp-input-end)))))
   ))

(defun gp-treat-special-inputp nil
  (save-excursion
    (beginning-of-line)
    (cond ((looking-at "---- (type return to continue) ----")
           (setq gp-complete-expression t)
           (end-of-line)
           (setq gp-input-start (point) gp-input-end (point))
           t)
          ((looking-at (concat "\\(" gp-prompt-pattern "\\)\\?\\\\"))
           (setq gp-complete-expression t)
           (end-of-line)
           (setq gp-input-start (- (point) 2) gp-input-end (point))
           t)
          (t nil))))

(defun gp-send-input (&optional localp)
  "Sends input to gp. Does not send incomplete expressions
ie those starting with {, without a matching }, or those
ending with \\ .
Uses a temporary file (and \\r ) for large expressions.
If LOCALP is non nil, then it is assumed the input comes
from the *PARI* buffer, in which case if this input was a
`\r '-command, sends the output to 'gp-output-filter.
If LOCALP is nil, then if a file is being read which is
currently being displayed, sends the output to 'gp-special-output-filter.

Sub-functions are 'gp-treat-special-inputp and 'gp-copy-input
with whom it shares the variables:
'gp-input-start 'gp-input-end 'gp-complete-expression
'gp-input-start-backetp 'gp-reads-this-buffer."

  (if (gp-treat-special-inputp)
      nil ;; already treated.
      (gp-copy-input)) ;; does all the work!
  (if gp-complete-expression
;; If it is a complete expression do this:
      (progn
        (insert "\n")
        (gp-input-filter)
        (if (> (- gp-input-end gp-input-start) 1023)
  ;;  If large expression, use a temporary file.
          (progn
            (write-region gp-input-start gp-input-end gp-temp-file)
            (process-send-string gp-process (concat "\\r "gp-temp-file"\n")))
  ;;  Else use process-send-region.
          (if gp-input-start-bracketp
              (process-send-region gp-process gp-input-start gp-input-end)
            (process-send-string gp-process "{")
            (process-send-region gp-process gp-input-start gp-input-end)
            (process-send-string gp-process "}"))
          (process-send-string gp-process "\n"))
        (set-marker (process-mark gp-process) (point))
        (if gp-should-wait-for-outputp
            (progn (gp-wait-for-output gp-input-end) (gp-update-hilit))
            (setq gp-should-wait-for-outputp t))
        (if localp
            ;; Sometimes the output should not be sent to the output filter:
           (progn
             (save-excursion
               (goto-char gp-input-start)
               (setq localp
                     (not (re-search-forward "\\\\r +" gp-input-end t))))
             (if (and localp (not gp-no-separate-window-for-mistakes))
                 (gp-output-filter)))
           (if (and (stringp gp-reads-this-buffer)
                    (buffer-visiblep gp-reads-this-buffer))
               ;; If an error is detected, and a buffer is visible
               ;; containing gp-reads-this-buffer, then we should move the
               ;; point to the place where the error is detected.
               (gp-special-output-filter))))

;; Else (not a complete expression) do this:
      (gp-C-j)
      (message (gp-messager 9))))

(defun gp-send-local-input nil
  "An input is declared to be `local' if it comes from the *PARI* buffer."
  (interactive) (gp-send-input t))

(defun gp-interrupt ()
  "Interrupts gp.
This is identical to interrupt-shell-subjob in shell-mode."
  (interactive) (interrupt-process nil t))

;;---------------
;; META-COMMANDS
;;---------------

(defmacro gp-meta-cmd-general (cmd window-option)
  "With 'gp-beginning for window-option, it is 'gp-meta-cmd.
With nil, it is 'gp-quiet-meta-cmd."
  (` (progn
    (set-buffer "*PARI*")    ;; In case we use it from another buffer,
                             ;; but a gp process is running.
    (goto-char (point-max))
;; Make gp send text to the buffer end, so we can move it to the help buffer.
    (set-marker (process-mark gp-process) (point))
    (let ((temp (point)))
      ;; Send the meta command to gp.
      (process-send-string gp-process (concat (, cmd) "\n"))
      ;; Wait for the gp-prompt to be sent.
      (gp-wait-for-output temp)

      ;; Display the output in the help buffer:
      (let ((copy (buffer-substring temp (point-max))))
        (delete-region temp (point-max))
        (if (eq (, window-option) 'gp-beginning)
            ;;Switch to buffer "*gp-help*":
            (gp-window-manager "*gp-help*" (, window-option))
            (set-buffer (get-buffer-create "*gp-help*"))
            (erase-buffer))
            
        (insert copy)
        (beginning-of-line)  ;; We remove the last prompt line.
        (delete-region (point) (point-max))
        (goto-char (point-min)))))))

(defun gp-meta-cmd (cmd)
  "Send cmd to gp, and display output in help buffer"
  (save-excursion
    (let ((wind (selected-window)))
         (gp-meta-cmd-general cmd 'gp-beginning)
         (select-window wind))
         (gp-info-wind-conf)))

(defun gp-quiet-meta-cmd (cmd)
  "Send cmd to gp, and copy output in help buffer without displaying it"
  (save-excursion (gp-meta-cmd-general cmd nil)))

(defun gp-set-prompt (p)
  "Set new gp prompt (and tell both gp and emacs that you have done so)."

  (interactive "sNew prompt: ")
  (let ((my-buffer (buffer-name)) temp)
   (set-buffer "*PARI*")
   (goto-char (setq temp (point-max)))
;; New pattern matches p OR old-pattern
   (gp-make-gp-prompt-pattern (gp-make-prompt-pattern p))
   (gp-tell-hilit-about-patterns)
;; Tell gp about the change too!
   (insert (concat "default(prompt,\"" p "\");\n"))
   (process-send-string gp-process (concat "default(prompt,\"" p "\");\n"))
   (set-marker (process-mark gp-process) (point))
   (gp-wait-for-output temp)
   (gp-update-hilit)
;; In case it is called from the menu-bar, do not write anything:
   (message "")
   (set-buffer my-buffer)))

(defun gp-make-prompt-pattern (p)
  "Make the regexp that matches the prompt p."
  ;; We use the buffer *Messages* to analyse the prompt.
  (save-excursion
    (set-buffer "*Messages*")
    (goto-char (point-max))
    (insert "\n" p) ; The "\n" is most probably useless.
    (beginning-of-line)
    (let ((where (point)) a-char)
         (setq p "")
         (while (not (eolp))
          (if (re-search-forward "%[a-zA-Z%]" nil t)
              (setq p
               (concat p
                (regexp-quote (buffer-substring where
                                                (match-beginning 0)))
                (progn (setq a-char (buffer-substring (1- (point)) (point)))
                       (setq where (point))
                             ;;Options from strftime:
                       (cond ((string= a-char "%") "%")
                             ((member a-char 
                               '("C" "d" "e" "H" "I" "k" "l" "m" "M" "S"
                                 "U" "V" "W" "y"))
                              "[0-9][0-9]")
                             ((member a-char '("D" "T"))
                              "[0-9][0-9]/[0-9][0-9]/[0-9][0-9]")
                             ((string= a-char "R")
                              "[0-9][0-9]:[0-9][0-9]")
                             ((member a-char '("a" "A" "b" "B"))
                              "[A-Z][a-z]*")
                             ((string= a-char "n")
                              "\n")
                             ;; If everything else fails:
                             (t (concat "%" a-char))))))
              ;; No % anymore:
              (goto-char (point-max))
              (setq p
               (concat p
                (regexp-quote (buffer-substring where (point-max))))))))
          ;; Now p contains the regexp matching the prompt.
    ;; We erase what we have written on this buffer:
    (beginning-of-line) (backward-char 1)
    (delete-region (point) (point-max))
  ;;Return p:
  p))

(defun gp-set-simple-prompt nil
  "Set the prompt to \"? \"."
  (interactive)
  (gp-set-prompt "? "))

(defun gp-set-time-prompt nil
  "Set a prompt that gives the time."
  (interactive)
  (gp-set-prompt "(%H:%M)> "))

(defun gp-set-date-prompt nil
  "Set a prompt that gives the date."
  (interactive)
  (gp-set-prompt "%d %b %y >> "))

(defun gp-set-separator-prompt nil
  "Set a prompt with a separator "
  (interactive)
  (gp-set-prompt "-------------------------%n(%H:%M)> "))

(defun gp-meta-d ()
  "Send \\d to gp, then display output in the help buffer.
Print the gp defaults."
  (interactive)
  (gp-meta-cmd "\\d"))

(defun gp-meta-t ()
  "Send \\t to gp, then display output in the help buffer.
Print the longword format of PARI types."
  (interactive)
  (gp-meta-cmd "\\t"))

(defun gp-meta-r (file)
  "Send a \\r <file name> command to gp.
Read in gp commands from a file."
  (interactive "fRead from file: ")
  (goto-char (point-max))
  (insert (concat "\\r " (expand-file-name file)))
  (gp-send-input))

(defun gp-meta-w (file num)
  "Send a \\w<num> <file name> command to gp.
Writesgp object %<num> to <file name>."
  (interactive "FWrite to file: \nsObject number %%")
  (goto-char (point-max))
  (insert (concat "\\w"num" " (expand-file-name file)))
  (gp-send-input))

(defun gp-meta-x nil
  "Send \\x to gp, then display output in the help buffer.
Print tree of addresses and contents of last object."
  (interactive)
  (gp-meta-cmd "\\x"))

(defun gp-meta-v nil
  "If gp is running, send \\v to gp, then display output
in the help buffer. Print the version number of this
implementation of pari-gp."
  (interactive)
  (if (processp gp-process) (gp-meta-cmd "\\v")
      (message (gp-messager 11) gp-version)))

(defun gp-meta-s (num)
  "Send \\s or \\s(num) to gp, then display output in the help buffer.
Print the state of the pari stack."
  (interactive "sNumber of longwords (default 0) ")
  (if (equal num "")
    (gp-meta-cmd "\\s")
    (gp-meta-cmd (concat "\\s(" num ")" ))))

(defun gp-meta-a (num)
  "Send \\a or \\a<num> to gp, then display output in the help buffer.
Print object %<num> in raw format."
  (interactive "sPrint object (default last) %%")
  (gp-meta-cmd (concat "\\a" num)))

(defun gp-meta-b (num)
  "Send \\b or \\b<num> to gp, then display output in the help buffer.
Print object %<num> in pretty format."
  (interactive "sPrint object (default last) %%")
  (gp-meta-cmd (concat "\\b" num)))

(defun gp-meta-m (num)
  "Send \\m or \\m<num> to gp, then display output in the help buffer.
Prins object %<num> in prettymatrix format."
  (interactive "sPrint object (default last) %%")
  (gp-meta-cmd (concat "\\m" num)))

(defun gp-meta-q ()
  "Send \\q to gp.
Prompt for confirmation before quiting."
  (interactive) 
  (if (y-or-n-p "Quit gp ? ") 
    (progn
     (set-buffer "*PARI*")
     (goto-char (point-max))
     (process-send-string gp-process "\\q\n")
     (setq gp-process nil) ;; Should be automatic with the previous one.
                           ;; Works better like this.
    ))
  (message ""))

(defun gp-break-long-line nil
  "gp will not accept lines longer than 1024.
gp-break-long-line breaks current line 
inserting \\ every (frame-width)-5 chars."
  (interactive)
  (let ((length (min (- (frame-width) 5) 250)))
  (move-to-column length)
  (while (not (looking-at "$"))
    (insert "\\\n")
    (move-to-column length))))

(defun gp-hilit-switch nil
   (interactive)
   ;; When this function is called, gp-can-hilit and gp-hilit are the same.
   (setq gp-can-hilit (not gp-can-hilit))
   (gp-update-hilit-buffers))

(defun gp-tutorial-switch nil
  (interactive)
  (if (setq gp-tutorial-requiredp (not gp-tutorial-requiredp))
      (message (gp-messager 12))
      (message (gp-messager 13))))

(defun gp-copy-last-input nil
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (if (re-search-backward gp-prompt-pattern nil t 2)
        (progn (goto-char (match-end 0))
               (gp-copy-input)))))

(defun gp-previous-cmd nil
  "Recall previous gp command."
  (interactive)
  (gp-relative-cmd -1))

(defun gp-next-cmd nil
  "Step to gp next command line."
  (interactive)
  (gp-relative-cmd 1))

(defun gp-relative-cmd (dir)
  "Step to previous or next command line according to the first argument
being 1 or -1."
  (while (and (zerop (forward-line dir))
              (not (looking-at gp-prompt-pattern))
              (looking-at "^"))); forward-line at the end of a buffer
  (end-of-line))

(defun gp-toggle-previous-next-behavior nil
  "Change C-p/M-p C-n/M-n from previous-line and next-line to
gp-previous-cmd and gp-next-cmd and reciprocally"
  (interactive)
  (if (equal (key-binding "\C-p") 'previous-line)
      (progn
        (define-key gp-map "\M-p" 'previous-line)
        (define-key gp-map "\M-n" 'next-line)
        (define-key gp-map "\C-p" 'gp-previous-cmd)
        (define-key gp-map "\C-n" 'gp-next-cmd))
    (define-key gp-map "\C-p" 'previous-line)
    (define-key gp-map "\C-n" 'next-line)
    (define-key gp-map "\M-p" 'gp-previous-cmd)
    (define-key gp-map "\M-n" 'gp-next-cmd)))

(defun gp-toggle nil
  "Change some keys. See gp-toggle-previous-next-behavior"
  (interactive)
  (gp-toggle-previous-next-behavior)
  (message (gp-messager 14)))

(defun gp-remove-last-output nil
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (if (re-search-backward gp-prompt-pattern nil t)
        (delete-region gp-input-end (point-max)))))

(defun gp-remove-last-action nil
  (interactive)
  (save-excursion
    (goto-char (point-max))
    (if (re-search-backward gp-prompt-pattern nil t)
        (let ((where (1- (point))))
             (if (re-search-backward gp-prompt-pattern nil t)
                 (delete-region (1- (point)) where))))))

;;-------------------------
;; GP COMPLETION FUNCTIONS
;;-------------------------

(defun gp-mouse-2 (event)
  "A kind of hook for 'mouse-choose-completion."
  (interactive "e")
  (funcall 'mouse-choose-completion event)
  ;; 'mouse-choose-completion comes from the standard file "mouse.el".
  (gp-restore-wind-conf) (forward-word 1))

(defun gp-clear-list (lst)
  "Remove the lists `(\"\")' from LST."
  (let ((newlist nil))
    (mapcar (lambda (liststring)
              (or (string= (car liststring) "")
                  (setq newlist (cons liststring newlist))))
            lst)
    newlist))

(defun gp-clear-list2 (lst)
  "Remove the empty words from LST."
  (let ((newlist nil))
    (mapcar (lambda (astring)
              (or (string= astring "")
                  (setq newlist (cons astring newlist))))
            lst)
    newlist))

(defun gp-make-cpl-list (abuffer)
"Take a buffer in the format of pari.menu, and create the list
whose name is the concatenation of \"gp-cpl-\" and the buffer-name
and which contains all the non-commented lines of the buffer.
The file must have at least one comment line, starting with #, All
lines before the first comment line are IGNORED. Finally add this list
name to 'gp-cpl-lists-list."
  (save-excursion
   (let ((lst nil) lst-aux astring)
     (set-buffer abuffer)
     (save-restriction
       (widen)
       (goto-char (point-min))
       (re-search-forward "#")
       (while (not (eobp))
         (forward-line 1)
         (or (looking-at "#")
             (add-to-list 'lst
                (list
                 (buffer-substring (point)
                                   (gp-get-end-of-line))))))
       (setq astring
             (concat "gp-cpl-"
                     (gp-proper-name (buffer-name))))
       (make-symbol astring)
       (set (intern astring) (gp-clear-list lst))
       (setq lst-aux (list (intern astring)))
       (setcdr lst-aux (cdr gp-cpl-lists-list))
       (setcdr gp-cpl-lists-list lst-aux)
       (kill-buffer abuffer)
      ))))

(defun gp-cpl-file (afile)
  "Same as 'gp-make-cpl-list except that we start with a file."
  (interactive "fFile of command names: ")
    (gp-make-cpl-list (find-file-noselect afile)))

(defsubst gp-add-symbol  (name)
  "Add a name to the obarray, if it is not already there."
  (make-symbol name)
  (intern name gp-c-array))

(defun gp-cpl-init nil
"Add all the commands listed by gphelp -k \"\" to the obarray
used for completion."
  (save-excursion
    (set-buffer (get-buffer-create "*gp-menu*"))
    (erase-buffer)
    (gp-call-gphelp 100 " " t "-k -raw")
    (gp-replace "\033\\[.?m" "")
    (let ((adoublelist (gp-buffer-to-double-list)))
      (mapcar 'gp-add-symbol (car adoublelist))
      (setq gp-main-menu-list (nth 1 adoublelist)))
    (kill-buffer "*gp-menu*")))

(defun gp-find-word-to-complete nil
  (save-excursion
   (let ((pt (point)))
      (if (char-equal (preceding-char) ?() (forward-char -1))
      (if (not (bolp))
          (progn
            (forward-char -1)           
            (if (looking-at "\\w")
                (progn (forward-char 1) (forward-word -1))
                (forward-char 1))))
      ;; In case it is a command-word:
      (if (= (preceding-char) ?\\) (forward-char -1))
      (if (= (point) pt) " "
          (buffer-substring (point) pt)))))

(defun gp-string-to-list (astring)
  "ASTRING is a succession of gp-words separated by spaces or newlines.
The answer is the list of these words."
  (let ((lst nil) (beg 0) (end 1))
    (while (<= end (length astring))
      (cond ((member (aref astring (1- end)) '(?\  ?\n))
             (if (not (= beg (1- end)))
                 (setq lst (nconc lst
                                  (list (substring astring beg (1- end))))))
             (setq beg end end (1+ end)))
            (t (setq end (1+ end)))))
    ;; taking care of the last one:
    (if (not (= beg (1- end)))
        (setq lst (nconc lst (list (substring astring beg (1- end))))))
    lst))

(defun gp-sort-and-minimise (list1 list2)
  "Take two lists of strings and build the list of all their
elements with no repetition and sorted out."
   (let ((lst (sort (nconc list1
                           (mapcar
                             (lambda (elt) (if (member elt list1) "" elt))
                             list2))
                    'string-lessp)))
    (if (string= (car lst) "") (cdr lst) lst)))


(defun gp-make-standard-word (word)
  "If WORD has a final \"()\", remove it."
 ;; When asking for completion and there is a unique completion, readline
 ;; adds sometimes `()' at the end of the completion.
  (if (and (> (length word) 1)
           (string= (substring word (- (length word) 2)) "()"))
      (substring word 0 (- (length word) 2))
      word))

(defsubst standard-string= (word1 word2)
  (string= (gp-make-standard-word word1)
           (gp-make-standard-word word2)))

(defsubst gp-standard-lst (word comp)
   (cond ((and (string= (car comp) "") (null (nth 1 comp)))
          (list ""))
         ((null (nth 1 comp))
          (list (concat word (car comp))))
         (t (nth 1 comp))))

(defun gp-merge-cpls (word comp1 comp2)
  (let* ((lst1 (gp-standard-lst word comp1))
         (lst2 (gp-standard-lst word comp2))
         (a-local-cpl-list (mapcar 'list (gp-sort-and-minimise lst1 lst2))))
     (gp-ask-cpl-via-list word 'a-local-cpl-list)))

(defun gp-ask-cpl-via-list (word lst)
  "Careful! LST is a symbol whose value is a list of completion type,
ie a list of lists whose cars are strings used for completion."
  ;; LST can be an array also.
  (setq lst (symbol-value lst))
  (let ((comp (try-completion word lst))
        to-insert fun-list)
    (cond ((equal comp nil)         ; No completion.
           (list "" nil))
          ((equal comp t)           ; Already complete.
           (list "" nil))
          ((> (length comp) (length word)) ; Some completion with a kernel.
           (setq to-insert (substring comp (length word)))
           (setq fun-list
                 (all-completions comp lst))
           (if (< (length fun-list) 2)
               (list to-insert nil)  ; Unique completion.
               (list to-insert fun-list)))
          (t (setq fun-list 
                   (all-completions comp lst))
             (if (< (length fun-list) 2)
                 (list "" nil)       ; Unique completion.
                 (list "" fun-list))))))

(defun gp-ask-cpl-via-readline (context)
  (let ((to-insert nil) (fun-list ""))
                    
   (if (gp-background nil)
    (save-excursion
      (set-buffer "*PARI*")
      (goto-char (point-max))
      (set-marker (process-mark gp-process) (point))
      (let ((temp (point)) (last nil))

  ;; ask for all completions (readline command)
        (process-send-string gp-process (concat context "\t" ))
        (let ((notdone t))
	  (while notdone 
	    (accept-process-output gp-process)
	    (let ((p (point)))
	      (if (or
		    (not (and (processp gp-process) 
			    (eq 'run (process-status gp-process))))
		  (search-backward "@E_N_D" (1+ temp) t))
	;; If gp is not running, or @E_N_D  has appeared, stop.
	      (progn 
		(message (gp-messager 6))
		(setq notdone nil last (point)))
	;; Else wait a bit longer.
	      (message (gp-messager 15)) (goto-char p)))))

      ;; Get end of completed-part:
      (search-backward "@" nil t)
      (setq to-insert (buffer-substring temp (point)))
      (forward-char 1) ;; In order to skip the "@".
      ;; Possible further completions:
      (if (< (point) last)
	(setq fun-list (buffer-substring (point) (1- last))))
      (delete-region temp (point-max))
      ;; clear line in the gp-process:
      (process-send-string gp-process "\C-A\C-K"))))

   (list to-insert (gp-string-to-list fun-list))))

(defun gp-general-complete (completion-function word)
  "Answer a list whose car is an extension of WORD, and whose cdr
is a list of list of possible matching words."
    (let ((ans (funcall completion-function word)))
    ;; 'gp-find-word-to-complete puts the point at
    ;; the end of the word to complete.

    ;; Insert the beginning of the completion
    ;; BEFORE any window change :    
    (if (not (string= (car ans) ""))
        (progn
          (insert (car ans))
          ;; In case of a direct completion via readline:
          (if (char-equal (preceding-char) ?)) (forward-char -1))))

    (if (equal (nth 1 ans) nil)
    ;; at most one match:
	(if (and (get-buffer "*Completions*")
                 (get-buffer-window "*Completions*"))
            ;; Occurs whenever an earlier completion has
            ;; been asked for.
            (progn
              (gp-restore-wind-conf)
              (forward-word 1)
              ;; In case of a completion via readline:
              (if (and (char-after (point))
                       (char-equal (char-after (point)) ?())
                (forward-char 1))
              (if (char-equal (preceding-char) ?)) (forward-char -1))))
    ;; more than two matches:
    (if (string= (car ans) "")
      ;; We do not display anything if a partial completion was possible:
      (progn
        (if (not (and (get-buffer "*Completions*")
                      (get-buffer-window "*Completions*")))
            ;; No use storing wind-conf if some completion is in
            ;; progress.
            (gp-store-wind-conf))
        (with-output-to-temp-buffer "*Completions*"
	  (display-completion-list (nth 1 ans))))))))

(defun gp-ask-cpl-via-readline-and-emacs (word)
  (interactive)
  (let ((lst
         (if (or (and gp-readline-enabledp (string= word ""))
                 (and gp-readline-enabledp gp-process
                      (equal (process-buffer gp-process) (current-buffer))))
             ;; Do not use general completion (let readline work !):
             '("" nil)
             ;; Ask for general completion:
             (gp-ask-cpl-via-list
                word (car gp-cpl-lists-list)))))
    (mapcar
      (lambda (a-cpl-list)
        (setq lst
          (gp-merge-cpls
            word
            (gp-ask-cpl-via-list word a-cpl-list)
            lst)))
      (cdr gp-cpl-lists-list))

    (cond ((and gp-readline-enabledp gp-process
                (equal (process-buffer gp-process) (current-buffer)))
           (save-excursion
              (if (re-search-backward gp-prompt-pattern nil t)
                  (setq gp-input-start (match-end 0))  ;; end of prompt
                  (setq gp-input-start (point-min))))
           (gp-merge-cpls
              word lst
              (gp-ask-cpl-via-readline
                (buffer-substring gp-input-start (point)))))
          (gp-readline-enabledp
           (gp-merge-cpls
              word lst
              (gp-ask-cpl-via-readline
                (buffer-substring (gp-get-beginning-of-line) (point)))))
          (t lst))))

(defun gp-complete nil
  (interactive)
  (gp-general-complete 'gp-ask-cpl-via-readline-and-emacs
                       (gp-find-word-to-complete)))

;;------------------
;; COMPLETION FILES
;;------------------

(defsubst gp-cpl-stamp (my-cpl-file)
  "Put a completion-file-stamp on a buffer."
  ;; Do not convert that in any other langage ! See gp-actualise-stamp.
  (insert (format "\nCompletion File Name: %s\n\n" my-cpl-file))
  (insert
    "----------------------------------------------------------------\n"
    "                     Created: " (current-time-string) "\n"
    "                     By:      " (user-full-name) "\n\n"
    "                     Last Modification: " (current-time-string) "\n"
    "----------------------------------------------------------------\n"
    "\n### Function Names : (one per line)\n"))

(defsubst gp-actualise-stamp nil
  "Actualise the completion-file-stamp of a buffer."
   (goto-char (point-min))
   (if (re-search-forward "Last Modification: " nil t)
   ;; We have found this string and update what's behind:
       (let ((kill-whole-line nil)) ;; local value of global parameter.
         (backward-char 1) ;;so that we are sure something is on this line. 
         (kill-line)
         (insert " " (current-time-string)))))

;; Edition of completion file. We follow a loose way of working
;; in case the user edits other buffers in between.

(defun gp-edit-cpl-file (my-cpl-file)
  "Edit my-cpl-file."
  (interactive
    (list (gp-read-input (gp-messager 33)
                   (concat (gp-possible-file-name) ".cpl") "" t)))
 
    (gp-store-wind-conf)
    (or (file-exists-p (expand-file-name my-cpl-file))
        ;; If the file does not exist, create it (the list may exists though):
        (gp-prepare-cpl-file t))
    (switch-to-buffer-other-window
       (find-file-noselect my-cpl-file))
    (goto-char (point-min))
    (if (eobp) (gp-cpl-stamp my-cpl-file)
               (re-search-forward "#.*$" nil t)
               (goto-char (match-end 0))
               (if (eobp) (insert "\n") (forward-char 1)))
    (message (gp-messager 16)))

(defsubst gp-cpl-bufferp (abuffer)
  (string= (name-extension abuffer) "cpl"))

(defun gp-quit-cpl-edit nil
  (interactive)
  (if (gp-cpl-bufferp (buffer-name))
      (progn
        ;; After entering 'gp-edit-cpl-file,
        ;; the user may have edited another completion file...
        ;; We don't bother since nothing bad will happen. The
        ;; behaviour of emacs may simply daze the user.
        (gp-actualise-stamp)
        (save-buffer 0)  ;; No backup file.
        (gp-backward-wind-conf)
       )))

(defsubst gp-make-cpl-help (file)
  (if gp-tutorial-requiredp
      (let ((wind (selected-window)))
       (gp-window-manager "*gp-help*" 'gp-beginning-temp)
       (insert (format (gp-messager 30) file file file file))
       (fill-region (point-min) (point-max) 'left)
       (select-window wind))))

(defsubst gp-show-help (astring)
   (gp-window-manager "*gp-help*" 'gp-beginning-temp)
   (insert astring)
   (setq fill-column (1- (window-width (get-buffer-window "*gp-help*"))))
   (fill-individual-paragraphs (point-min) (point-max) 'left)
   ;; Remove help window :
   (gp-window-manager "*gp-help*" 'gp-remove-help-old-config)
   (gp-restore-wind-conf))

(defun gp-cpl-file-info nil
  (interactive)
  (gp-show-help (gp-messager 29)))

(defmacro gp-cpl-file-has (astring)
  "t if the edited completion file has the string ASTRING
at a beginning of line followed by \n or a  space or a #.
Also t when ASTRING is the empty string."
 (`
  (if (string= (, astring) "") t
    (save-excursion
     (goto-char (point-min))
     (re-search-forward "#")  ; There exists such a line.
     (end-of-line)
     (if (eobp)
         nil  ;; Return value is nil.
        (forward-line 1)
        (re-search-forward
         (concat "^" (regexp-quote (, astring)) "[\n| |#]") nil t))))))

(defun gp-prepare-cpl-file (option)
"  Write in the file `buffername.cpl' which has the format of a completion
file (i.e. a gp-menu file) the names of the functions and of the  global
variables of the visited file. OPTION is t means save the buffer on file,
nil means don't do that if the file wasn't existing already."
  (let* ((file (buffer-name)) (my-cpl-file (concat file ".cpl")))
   (or option (gp-make-cpl-help file))
   ;; Prepare buffer:
   (save-excursion
    (if (or option
            (file-exists-p (expand-file-name my-cpl-file)))
      (set-buffer (find-file-noselect my-cpl-file))
      (set-buffer (get-buffer-create my-cpl-file)))
    (if (file-exists-p (expand-file-name my-cpl-file))
        (progn
           ;; Assume it has the format of a completion-file:
           (re-search-forward "#" nil t)
           (end-of-line)
           (if (eobp) (insert "\n")
               (forward-line 1) (beginning-of-line)
               (kill-region (point) (point-max))))
        (if option (gp-cpl-stamp my-cpl-file)
            (insert "\n### Function Names : (one per line)\n")))
    ;; Add function names:
    (set-buffer file)
    (goto-char (point-min))
    (let ((thelist nil))
    (while (re-search-forward gp-function-proto-pstart nil t)
           (add-to-list 'thelist (match-string 2)))
    (setq thelist (sort thelist (function string-lessp))) ; We order things.
    (set-buffer my-cpl-file)
    (mapcar (lambda (fn) (insert fn "\n")) (gp-clear-list2 thelist)))

    ;; Prepare buffer for names of global variables:
    (insert (gp-messager 25) "\n")

    ;; Add global-variable-names:
    (set-buffer file)
    (goto-char (point-min))
    (let (theplace (thelist nil))
    (while (setq theplace (gp-find-global-var nil))
           (add-to-list 'thelist
             (buffer-substring (car theplace) (cdr theplace))))           
    (setq thelist (sort thelist (function string-lessp))) ; We order things.
    (set-buffer my-cpl-file)
    (mapcar (lambda (fn) (insert fn "\n")) (gp-clear-list2 thelist)))
    
    (if (or option (file-exists-p my-cpl-file))
        (progn
          ;; Prepare buffer for closing, no backup-file:
          (gp-actualise-stamp)
          (save-buffer 0)))
    ;; Add it to the possible completions:
    (gp-make-cpl-list (buffer-name)))

   ;; Remove help window
   (if (and (not option) gp-tutorial-requiredp)
     (progn
       (gp-window-manager "*gp-help*" 'gp-remove-help-old-config)
       (gp-restore-wind-conf))
   )))

(defun gp-make-cpl-file nil
  (interactive)
  (gp-prepare-cpl-file nil))

;;------------
;; TeX MANUAL
;;------------

;; The line ";;;###autoload" is useless.
;; It will be useful when pari.el will be part
;; of the usual distribution of emacs.
;;;###autoload
(defun gpman()
  "Start up xdvi with the gp manual."

  (interactive)
;; Run gp-mode-hook in case it specifies a different version of the manual.
  (run-hooks 'pari-mode-hook 'gp-mode-hook)
  (gp-get-TeX-man-entry ""))

(defun gp-tutorial()
  "Start up xdvi with the gp tutorial."

  (interactive)
;; Run gp-mode-hook in case it specifies a different version of the tutorial.
  (run-hooks 'pari-mode-hook 'gp-mode-hook)
  (gp-get-TeX-man-entry "tutorial"))

;;-------------------
;; Help on gp-*-mode
;;-------------------

(defun gp-show-pariemacs nil
  "Show pariemacs.txt on another window."
  (interactive)
;; Run gp-mode-hook in case it specifies a different version of pariemacs.txt.
  (run-hooks 'pari-mode-hook 'gp-mode-hook)
  (let ((wind (selected-window))
        (where-it-is "")
        (to-be-tested (list "/usr/local/lib/pari/emacs/"
                            "/usr/local/share/lib/pari/emacs/"
                            "/usr/share/lib/pari/emacs/"
                            "/usr/local/lib/pari/"
                            "/usr/local/share/lib/pari/"
                            "/usr/share/lib/pari/"
                            (concat "/usr/local/lib/pari-" gp-version "/emacs/")
                            (concat "/usr/local/share/lib/pari-" gp-version "/emacs/")
                            (concat "/usr/share/lib/pari-" gp-version "/emacs/")
                            (concat "/usr/local/lib/pari-" gp-version "/")
                            (concat "/usr/local/share/lib/pari-" gp-version "/")
                            (concat "/usr/share/lib/pari-" gp-version "/"))))

    ;; Locate pariemacs.txt:
    (mapcar (lambda (afile) (if (file-exists-p afile) (setq where-it-is afile)))
            (mapcar (lambda (apath) (expand-file-name (concat apath "/pariemacs.txt")))
                    (append to-be-tested load-path)))

    (if (not (string-equal where-it-is ""))
      (progn
        ;; We switch to the buffer *gp-help* and erase its content:
        (set-buffer (get-buffer-create "*gp-help*"))
        (erase-buffer)
        (message where-it-is)  ;; tell *Messages* which version of pariemacs is used.
        (insert-file where-it-is)
        ;; Show the help buffer and tell user how to remove help window:
        (gp-window-manager "*gp-help*" 'gp-show-help)
        (setq buffer-read-only t)
        (search-forward "Common commands" nil t)
        (beginning-of-line) (set-window-start (selected-window) (point))
        (gp-info-wind-conf)
        (select-window wind))
      ;; Tell the user the file was not found:
      (gp-show-help (gp-messager 39))))
  )  ; End of 'gp-show-pariemacs

;;--------------
;; GP HELP MODE
;;--------------

(defun gp-has-spacep (astring)
  "T if ASTRING contains a space and NIL otherwise"
  (let ((ans nil) (where 0) (ll (length astring)))
   (while (and (not ans) (< where ll))
      (setq ans (or ans (string= (substring astring where (1+ where)) " "))
            where (1+ where)))
   ans))

; Une programmation plus efficace avec emacs 20.3:
;(defsubst gp-has-spacep (word)
;  "T if WORD contains a space and NIL otherwise"
;  (not (eq (memq ?\  (string-to-list word)) nil)))

(defun gp-display-raw-menu (lst start end)
  (beginning-of-line)
  (set start (point))
  (save-excursion
    (mapcar
      (lambda (astring)
        (insert astring "\n")
        (put-text-property (- (1- (point)) (length astring)) (1- (point))
                           'mouse-face 'highlight))
      lst)
    (set end (point))
    (insert "\n")))

(defsubst gp-display-special-menu (lst)
  (gp-display-raw-menu lst 'gp-menu-start-special 'gp-menu-end-special))

(defsubst gp-display-keywords-menu (lst)
  (gp-display-raw-menu lst 'gp-menu-start-keywords 'gp-menu-end-keywords))

(defun gp-split-menu (lst)
  (let ((lst-simple nil) (lst-special nil))
    (mapcar
      (lambda (astring)
        (add-to-list (if (gp-has-spacep astring)
                         'lst-special
                         'lst-simple) astring))
      lst)
    (list lst-simple lst-special)))

(defun gp-display-simple-menu (lst)
  "Display the list of strings LST on several columns and sets
the values of 'gp-menu-start-simple, 'gp-menu-end-simple."
  (let*((length-list (sort (mapcar 'length lst) '>))
        (how-many (length lst))
        (gp-menu-width (car length-list))  ; maximal width
        gp-menu-main-width                 ; usual width + spaces
        (gp-menu-percent-exceptions 30)    ; maximal percentage of exceptionnal words
        (gp-menu-spaces 2)                 ; spaces between two columns
        (where (max 0 (1- (floor (* how-many gp-menu-percent-exceptions) 100)))))
       ;; Exceptionnal items will be spread over two columns.

       ;; There may be too many elements of exceptional width:
       (if (and (< (1+ where) how-many)
                (= (nth (1+ where) length-list) (nth where length-list)))
           (while (and (<= where 0)
                       (= (nth (1+ where) length-list) (nth where length-list)))
                  (setq where (1- where))))
       (if (> 0 where) (setq where 0))
       ;; The exceptional width may be too large:
       (while (and (<= where 0)
                   (< (+ gp-menu-spaces (* 2 (nth where length-list))) gp-menu-width))
              (setq where (1- where)))
       (if (> 0 where) (setq where 0))
       (setq gp-menu-main-width (nth where length-list))

       ;; Add some spaces between columns:
      (setq gp-menu-main-width (+ gp-menu-spaces gp-menu-main-width))
      ;; Compute 'gp-menu-nbcol:

      (if (< how-many (/ (window-height) 2))
          (setq gp-menu-nbcol 1)
          (setq gp-menu-nbcol (max 1 (floor (- (window-width) gp-menu-spaces) gp-menu-main-width))))
      (if (= gp-menu-nbcol 1)
          (setq gp-menu-main-width (+ gp-menu-spaces gp-menu-width)))

      ;; Display the list:
      (beginning-of-line)
      (setq gp-menu-start-simple (point))
      (save-excursion
      (let ((wherex 1))
        (mapcar
          (lambda (astring)
            (if (<= (length astring) (- gp-menu-main-width gp-menu-spaces))
                (progn
                   (insert astring)
                   (put-text-property (- (point) (length astring)) (point)
                                      'mouse-face 'highlight)
                   (if (< wherex gp-menu-nbcol)
                       (progn (setq wherex (1+ wherex))
                              (insert-char ?\  (- gp-menu-main-width (length astring))))
                       (setq wherex 1)
                       (insert "\n")))
              (if (< wherex gp-menu-nbcol)
                  (progn
                    (insert astring)
                    (put-text-property (- (point) (length astring)) (point)
                                       'mouse-face 'highlight)
                    (if (< wherex (1- gp-menu-nbcol))
                        (progn (setq wherex (+ 2 wherex))
                               (insert-char ?\  (- (* 2 gp-menu-main-width) (length astring))))
                        (setq wherex 1)
                        (insert "\n")))
                (insert "\n" astring)
                (setq wherex 1)
                (put-text-property (- (point) (length astring)) (point)
                                   'mouse-face 'highlight)
                (if (< wherex (1- gp-menu-nbcol))
                    (progn (setq wherex (+ 2 wherex))
                           (insert-char ?\  (- (* 2 gp-menu-main-width) (length astring))))
                    (setq wherex 1)
                    (insert "\n")))))
          lst)
        (or (= wherex 1) (insert "\n")))
      (message (gp-messager 38))
      (setq gp-menu-end-simple (point)))))
        
(defun gp-menu nil
  "Major-mode for the gp menu buffer.
The available commands are
\\{gp-menu-map}"
  (interactive)
  (or gp-main-menu-list (gp-cpl-init))
  (gp-window-manager "*gp-menu*" 'gp-beginning)
  (setq major-mode 'gp-menu mode-name "GP MENU")
  (use-local-map gp-menu-map)
  (gp-menu-survey))

(defsubst gp-menu-info nil
  (message (gp-messager 18)))

(defun gp-menu-next ()
  "Move down one line of the gp help menu. (Go to top if at the end.)"
  (interactive)
  (gp-menu-info)
  (forward-line 1)
  (if (eobp)
    (progn (ding)
           (goto-char (point-min))
           (re-search-forward "###\n" nil t))))

(defun gp-menu-previous ()
  "Move up one line of the gp help menu. (Go to bottom if at the top.)"
  (interactive)
  (gp-menu-info)
  (forward-line -1)
  (if (or (bobp) (looking-at "###\n"))
      (progn (ding) (goto-char (point-max)) (beginning-of-line))))

(defun gp-menu-C-v nil (interactive) (scroll-up) (gp-menu-info))

(defun gp-menu-M-v nil (interactive) (scroll-down) (gp-menu-info))

(defun gp-menu-right nil
  (interactive)
  (if (and (> (point) (1- gp-menu-start-simple))
           (< (point) gp-menu-end-simple))
      ;; multiple columns display:
      (progn
        (if (re-search-forward "[\n\t ][a-zA-Z]" nil t)
            (forward-char -1)))
      ;; single column display:
      (forward-char 1)))

(defun gp-menu-left nil
  (interactive)
  (if (and (> (point) (1- gp-menu-start-simple))
           (< (point) gp-menu-end-simple))
      ;; multiple columns display:
      (progn
        (if (re-search-backward "\\([\n\t ]\\|^\\)\\([a-zA-Z]+\\)[\n\t ]" nil t)
            (goto-char (match-beginning 2))))
      ;; single column display:
      (forward-char -1)))

(defun gp-menu-quit nil
  "Switch the *PARI* buffer if it exists, or (other-buffer) if it does not."
  (interactive)
  (gp-window-manager "*gp-menu*" 'gp-remove-help-now)
  (if (get-buffer-window "*gp-help*")
      (progn (gp-info-wind-conf)
             (if (string= (buffer-name) "*gp-help*")
                 (select-window (other-window 1))))))

(defsubst gp-menu-get-beg nil
  (save-excursion
    (re-search-backward "\\`\\|[ \n]" nil t)
    (match-end 0)))

(defsubst gp-menu-get-end nil
  (save-excursion
    (re-search-forward "\\'\\|[ \n]" nil t)
    (match-beginning 0)))

(defun gp-menu-select nil
  "Select a subject from the main menu, or a manual entry from a subject menu."
  (interactive)
  (cond ((and (> (point) (1- gp-menu-start-simple))
              (< (point) gp-menu-end-simple))
         (gp-get-man-entry
           (buffer-substring (gp-menu-get-beg) (gp-menu-get-end))))
        ((and (> (point) (1- gp-menu-start-special))
              (< (point) gp-menu-end-special))
         (gp-get-man-entry
           (buffer-substring (gp-get-beginning-of-line)
                             (gp-get-end-of-line))))
        ((and (> (point) (1- gp-menu-start-keywords))
              (< (point) gp-menu-end-keywords))
         (gp-get-apropos
           (buffer-substring (gp-get-beginning-of-line)
                             (gp-get-end-of-line))))
        (t (message (gp-messager 19)))))

(defun gp-menu-mouse-select (event)
  (interactive "e")
  (mouse-set-point event)
  (gp-menu-select))

(defun gp-menu-survey nil
  "Display the main menu."
  ;; Used while being in a window displaying "*gp-menu*".
  (interactive)
  (setq buffer-read-only nil)
  (erase-buffer)
  (save-excursion
    (insert "\n" (gp-messager 26) "\n")
    (gp-display-special-menu gp-main-menu-list)
    (goto-char (point-max))
    (insert (gp-messager 27) "\n")
    (gp-display-keywords-menu gp-main-menu-keywords-list))
  (setq buffer-read-only t)
  (setq gp-menu-start-simple 0 gp-menu-end-simple 0)
  (gp-menu-info))

;;; We start the browser.

(defun gp-browser-cmd (cmd to-buffer &optional nomessage slow-down)
  ;; A GP process is supposedly running.
  (set-buffer "*Simple PARI*")
  (goto-char (point-max))
  ;; Make gp send text to the buffer end, so we can move it to-buffer.
    (set-marker (process-mark gp-browser-process) (point))
    (let ((temp (point)))
      ;; Send the meta command to gp.
      (process-send-string gp-browser-process (concat cmd "\n"))
      ;; Wait for the gp-prompt to be sent.
      (gp-wait-for-output temp nomessage gp-browser-process)
      (if slow-down (sit-for 0 slow-down))

      (let ((copy (buffer-substring temp (point-max))))
        (delete-region temp (point-max))
        (set-buffer (get-buffer-create to-buffer))
        (erase-buffer)
        (insert copy)
        (beginning-of-line)  ; We remove last prompt line.
        (delete-region (point) (point-max))
        (goto-char (point-min)))))

(defun gp-browser-1-mode nil ""
  (interactive)
  (setq major-mode 'gp-browser-1)
  (use-local-map gp-browser-1-map))

(defun gp-browser-2-mode nil ""
  (interactive)
  (setq major-mode 'gp-browser-2)
  (setq gp-menu-start-simple (point-min))
  (use-local-map gp-browser-2-map))

(defun gp-browser-1-select nil
  (interactive)
  (remove-text-properties (point-min) (point-max) '(face))
  (put-text-property (gp-get-beginning-of-line) (gp-get-end-of-line)
                     'face 'underline)
  (let ((prop (get-text-property (point) 'follow)))
    (if (numberp prop) (gp-browser-follow prop))))

(defun gp-browser-1-mouse-select (event)
  (interactive "e")
  (mouse-set-point event)
  (gp-browser-1-select))

(defun gp-browser-2-select nil
  (interactive)
  (if (or (eobp) (looking-at "[ \n\t]+")) (skip-chars-backward " \n\t"))
  (gp-call-gphelp (window-width (get-buffer-window "*gp-function description*"))
                  (thing-at-point 'word) "*gp-function description*" "-detex")
  ;; Replace ESC[.?m by nothing: (\033 or \e)
  (set-buffer "*gp-function description*")
  (gp-replace "\033\\[.?m" ""))

(defun gp-browser-2-mouse-select (event)
  (interactive "e")
  (mouse-set-point event)
  (gp-browser-2-select))

(defun gp-browser-follow (num)
  (set-buffer "*gp-functions list*")
  (select-window (get-buffer-window "*gp-functions list*"))
  (erase-buffer)
  (gp-display-simple-menu (cdr (assq num gp-browser-follow-alist)))
  (setq gp-menu-end-simple (point-max)))

(defun gp-browser-main nil
  (setq major-mode 'gp-browser-1-mode)
  (mapcar (lambda (acons)
             (let ((temp (point)))
                  (insert (cdr acons))
                  (put-text-property temp (point) 'follow (car acons))
                  (put-text-property temp (point) 'mouse-face 'highlight)    
                  (insert "\n")))  gp-browser-main-alist)
  (goto-char (point-min)))

(defun gp-browser nil
  (interactive)
  (or gp-browser-main-alist
      (gp-make-browser))
  (setq gp-main-frame (selected-frame))
  (cond ((= gp-browser-style 1)
         (setq gp-browser-frame
               (make-frame (list '(name . "gp-browser")
                                 (cons 'width (frame-width gp-main-frame)))))
         (select-frame gp-browser-frame)
         (switch-to-buffer "*gp-browser*")
         (gp-browser-1-mode)
         (erase-buffer)
         (split-window nil (1+ (length gp-browser-main-alist)))
         (other-window 1)
         (switch-to-buffer "*gp-functions list*")
         (gp-browser-2-mode)
         (split-window nil 12)
         (other-window 1)
         (switch-to-buffer "*gp-function description*"))
        ((= gp-browser-style 2)
         (setq gp-browser-frame
               (make-frame (list '(name . "gp-browser")
                                 (cons 'width (+ 10 (frame-width gp-main-frame))))))
         (select-frame gp-browser-frame)
         (switch-to-buffer "*gp-browser*")
         (gp-browser-1-mode)
         (erase-buffer)
         (split-window nil (+ 5 (length gp-browser-main-alist)))
         (other-window 1)
         (switch-to-buffer "*gp-function description*")
         (select-window (get-buffer-window "*gp-browser*"))
         (split-window nil (+ 4 gp-browser-width) t)
         (other-window 1)
         (switch-to-buffer "*gp-functions list*")
         (gp-browser-2-mode))
        ((= gp-browser-style 3)
         (setq gp-browser-frame
               (make-frame (list '(name . "gp-browser")
                                 (cons 'width (frame-width gp-main-frame)))))
         (select-frame gp-browser-frame)
         (switch-to-buffer "*gp-browser*")
         (gp-browser-1-mode)
         (erase-buffer)
         (split-window nil (+ 4 gp-browser-width) t)
         (other-window 1)
         (switch-to-buffer "*gp-functions list*")
         (gp-browser-2-mode)
         (other-window -1)
         (split-window nil (1+ (length gp-browser-main-alist)))
         (other-window 1)
         (switch-to-buffer "*gp-function description*")))
  (set-buffer "*gp-browser*")
  (select-window (get-buffer-window "*gp-browser*"))
  (gp-browser-main)
  (set-default-font (gp-frame-parameter gp-main-frame 'font))
  (select-frame gp-main-frame))

(defsubst gp-split-to-strings (to)
  (let ((res nil))
    (while (re-search-forward "\\([^ \n\t]+\\)\\( \\|\n\\|\t\\)" to t)
      (setq res (nconc res (list (match-string 1)))))
    res))

(defun gp-make-browser nil
  ;; Make 'gp-browser-main-alist:
  (message (gp-messager 37))
  (get-buffer-create "*Simple PARI*")
  (set-buffer "*Simple PARI*")
  (setq gp-browser-process
    (gp-get-shell "simple-pari" "*Simple PARI*" (concat gp-file-name " -s 1000 -p 10 -emacs")))

  ;; We should run the hook as the prompt may have
  ;; been changed in the .gprc:
  (run-hooks 'pari-mode-hook)
  (gp-wait-for-output 1 t gp-browser-process)
  (gp-browser-cmd "?" "*gp-browser*" t)
  (goto-char (point-min))
  (forward-line 2) ; Skip item 0.
  (while (re-search-forward " +\\([1-90]+\\): \\([^\n]*\\)\n" nil t)
    (setq gp-browser-main-alist
       (nconc gp-browser-main-alist
             (list (cons (string-to-number (match-string 1)) (match-string 2))))
       gp-browser-width (max gp-browser-width (length (match-string 2)))))
  ;; Remove last item :
  (setq gp-browser-main-alist (nreverse (nthcdr 1 (nreverse gp-browser-main-alist))))
  ;; Make 'gp-browser-follow-alist:
  (setq gp-browser-follow-alist
   (mapcar
     (lambda (num)
       (erase-buffer)
       (gp-browser-cmd (concat "?" (number-to-string num)) "*gp-browser*" t 300)
       (cons num (gp-split-to-strings (point-max))))
     (mapcar 'car gp-browser-main-alist)))
  (gp-browser-cmd "\q" "*gp-browser*" t)
  (kill-buffer "*Simple PARI*")
  (message (gp-messager 6)))

;;--------------------
;; TeX AND USUAL INFO
;;--------------------

(defun gp-replace (a b)
  "Replace the regexp a by the string b everywhere in the current buffer"
  ;; b may be an expression whose value is a string, like
  ;; (buffer-substring (match-beginning 0) (match-end 0))
  (save-excursion
   (goto-char (point-min))
   (while (re-search-forward a nil t)
     (replace-match (eval b) t t))))

(defmacro gp-ask-name-wisely (this-type)
  "Ask in the minibuffer for a \"this-type\" name and provide a default"
 (`
  (list
  (let* ( ;; get the word before point into word:
             (word (gp-find-word-to-complete))
;; get the argument from the minibuffer into arg
             (arg
               (progn
                 (define-key minibuffer-local-completion-map " " 'self-insert-command)
                  ;; It is usually 'minibuffer-complete-word, but C-i does that.
                 (completing-read
                   (concat (, this-type)
                     (if (intern-soft word gp-c-array)
;; If the word before point is a gp function, offer it as default.
                         (concat " [Default " word "]" )) ": ")
;; use gp-c-array as the completion array
                   gp-c-array))))
      (define-key minibuffer-local-completion-map " " 'minibuffer-complete-word)
      (if (equal arg "")
;; If the argument supplied is "", and word is a gp symbol, use it as default.
;; (Do not use "" as fn in anycase, so otherwise use " ", which will not
;; produce a help window.)
        (if (intern-soft word gp-c-array) word " ") 
;; Else use the arg.
        arg)))))

(defun gp-get-TeX-man-entry (fn)
  "Similar to `??fn' under GP"
  (interactive (gp-ask-name-wisely (gp-messager 21)))

    (gp-call-gphelp (window-width) fn nil "")
    (if (buffer-live-p (get-buffer "*Shell Command Output*"))
      (save-excursion
          (set-buffer "*Shell Command Output*")
          (cond ((looking-at "\n") (kill-buffer nil))
                ((save-excursion
                   (goto-char (- (point-max) 13))
                   (looking-at " not found !"))
                 (kill-buffer nil)
                 (message (gp-messager 20) fn))))
      (message "")))

(defun gp-get-man-entry (fn)
  "Get the description of fn from chapter 3 of the manual
via gphelp, and display the result in a new window.
If there is no entry for fn in the manual, send ?fn to gp.
If a definition is found, add fn to the array of possible completions"

  (interactive (gp-ask-name-wisely "Function"))
  (let ((wind (selected-window)))
    ;; We switch to the buffer *gp-help* and erase its content:
    (set-buffer (get-buffer-create "*gp-help*"))
    (erase-buffer)
    (gp-call-gphelp (window-width (get-buffer-window "*gp-help*")) fn t "-detex")
    ;; Replace ESC[.?m by nothing: (\033 or \e)
    (gp-replace "\033\\[.?m" "")

    (goto-char (point-min))
    (if (save-excursion
           (goto-char (- (point-max) 13))
           (looking-at " not found !"))
           ;; If gp was not running then start it.
           (if (gp-background nil)
             (progn
               (gp-meta-cmd-general (concat "?" fn) nil)
               ;; which sets the buffer "*gp-help*".
               (if (looking-at " *\\*\\*\\* *unknown identifier")
                 (progn
                   (gp-window-manager "*gp-help*" 'gp-remove-help-now)
                   (message (gp-messager 20) fn))
               (if (looking-at " *\\*\\*\\* *user defined variable")
                 (progn
                   (gp-window-manager "*gp-help*" 'gp-remove-help-now)
                   (message (gp-messager 22) fn))
               ;; Else tell user how to remove the help window:
               (gp-window-manager "*gp-help*" 'gp-show-help)
               (gp-info-wind-conf)
               ;; and let the completion system know about the function name:
               (gp-add-symbol fn)))))
         ;; Else show the help buffer and tell user how to remove help window:
         (gp-window-manager "*gp-help*" 'gp-show-help)
         (gp-info-wind-conf))
    (select-window wind)))  ; End of 'gp-get-man-entry

(defun gp-buffer-to-double-list nil
  (let ((lst nil))
    (save-excursion
      (while (not (eobp))
         (add-to-list 'lst
                (buffer-substring (gp-get-beginning-of-line)
                                  (gp-get-end-of-line)))
         (forward-line 1)))
    (delete-region (point) (point-max))
    (gp-split-menu lst)))

(defun gp-get-apropos (exp)
"Show in gp-menu-mode the functions or sections
in whose description the expression EXP appears.
Similar to \"??? exp\" in gp."
  (interactive (gp-ask-name-wisely (gp-messager 32)))

  (gp-window-manager "*gp-menu*" 'gp-beginning)
  (insert (format (concat "\n" (gp-messager 31) "\n") exp))
  (insert "\n###\n")  ; To give this buffer the format of a gp-menu file.
  (gp-call-gphelp 50 exp t "-k -raw")
  ;; Replace ESC[.?m by nothing: (\033 or \e)
  (gp-replace "\033\\[.?m" "")

  (search-backward "\n###\n")
  (forward-char 5)
  (if (eobp)
      (progn
        (kill-buffer "*gp-menu*")
        (gp-backward-wind-conf)
        (message (gp-messager 23) exp))
      (set-buffer "*gp-menu*")
      (let ((adoublelist (gp-buffer-to-double-list)))
        (gp-display-simple-menu (car adoublelist))
        (goto-char (point-max))
        (and (car adoublelist) (insert "\n"))
        (gp-display-special-menu (nth 1 adoublelist)))
      (setq gp-menu-start-keywords 0 gp-menu-end-keywords 0)
      (setq major-mode 'gp-menu mode-name "GP MENU")
      (use-local-map gp-menu-map)
      (setq buffer-read-only t)
      (goto-char (point-min))
      (search-forward "\n###\n")
      (gp-menu-info)))

;;------------------------
;; PART V : HIGHLIGHTING
;;------------------------

;; We call all the symbols of the list gp-places-list: `gp-places'.
;; They will be linked to a pattern to be hilighted and to a face.
;; Well, not exactly to a face but to another symbol which
;; `hilit19.el' will recognise as corresponding to a face.
;; We call them `symbolic-face-name(s)', `symbolic-name(s)' or `color(s)'.

(defsubst gp-place-to-name (gp-place)
  (cdr (assq gp-place hilit-face-translation-table)))

(defun gp-add-to-gp-colors-list (asymbolic-name)
  (if (memq asymbolic-name gp-colors-list) nil
      (setq gp-colors-list (cons asymbolic-name gp-colors-list))))

(defun gp-init-gp-colors-list nil
  (sort
   (mapcar
    (lambda (quoted-gp-place)
     (gp-add-to-gp-colors-list (gp-place-to-name (eval quoted-gp-place))))
    gp-places-list)
   (function
     (lambda (p q)
      (string-lessp (symbol-name (gp-place-to-name p))
                    (symbol-name (gp-place-to-name q)))))))

(defmacro gp-save-acolor (gp-place)
 (`
  (insert "(hilit-translate " (symbol-name (, gp-place)) " '"
          ;; the nil face-name is replaced by default.
          (if (string= (symbol-name (gp-place-to-name (, gp-place))) "nil")
              "default"
              (symbol-name (gp-place-to-name (, gp-place))))
          ")\n")))

(defun gp-save-colors nil
"Store the colors of the gp-places in the file specified by pari-colors"
  (interactive)
  (save-excursion
    (set-buffer (get-buffer-create "pari-colors.el"))
    (set-visited-file-name pari-colors)
    (mapcar (lambda (quoted-gp-place)
              (gp-save-acolor (eval quoted-gp-place)))
            gp-places-list)

    ;; Now we make the changes but we do NOT keep the old version.
    ;; Will send a message when done.
    (if (file-exists-p pari-colors)
        (save-buffer 0) (write-file pari-colors))
    (setq pari-colors-modifiedp nil)
    (kill-buffer "pari-colors.el")))

(defun gp-hilit-translate () 
  "translate symbolic highlight group names to actual colors. If you work
with a dark background, set hilit-background-mode to 'dark before calling
this function"
  ;; Extend the list `hilit-face-translation-table' by adding the
  ;; conses (symbolic-name-here . symbolic-name-face). We recover the
  ;; symbolic-name-face by
  ;; (cdr (assq 'symbolic-name hilit-face-translation-table)).

  (interactive)
    (if (file-exists-p pari-colors)
        (progn
           (message (concat (gp-messager 24)
                            (file-name-directory pari-colors) "..."))
           (load-file pari-colors))
    (if (eq hilit-background-mode 'light)
  ;; light background
      (hilit-translate 
        gp-error   'red
        gp-history 'magenta3
        gp-prompt  'default
        gp-output  'blue3
        gp-input   'default
        gp-help    'red3
        gp-timer   'green3

        gp-comment           'blue3
        gp-control-statement 'red3
        gp-default-keywords  'red3
        gp-default-set       'green3
        gp-input-cmd         'green3
        gp-string            'grey50
        gp-global-var        'deepskyblue1-underline
        gp-function-proto    'deepskyblue1
        gp-function-args     'green3)

  ;; dark background
      (hilit-translate 
        gp-error   'red
        gp-history 'magenta3
        gp-prompt  'brown
        gp-output  'hex-ffff60
        gp-input   'default
        gp-help    'red3
        gp-timer   'green3

        gp-comment 'hex-80a0ff
        gp-control-statement 'hex-ffff60
        gp-default-keywords  'red3
        gp-default-set       'green3
        gp-input-cmd         'green3
        gp-string            'grey50
        gp-global-var        'deepskyblue1-underline
        gp-function-proto    'deepskyblue1
        gp-function-args     'green3))))


(defun gp-find-global-var (dummy)
  "A parser to find global variables. Called on a gp-program outside
a function-definition, gives position via (cons start end) of
next global-variable-definition not surrounded by {} and set the
point at the end of the line. Answer nil if no global-variable is found.
The end delimiter of a function definition surrounded by {} is
'}\n' and the same holds with function definitions of the style
'fun(var)={foo}'.
DUMMY is not used, but introduced for compatibility with
'hilit-set-mode-patterns"
  (let ((answer nil))
  (while (looking-at (concat comment-start-skip
     "\\|[ \\|\t\\|\n]\\|{\\([^}]\\|}[^\n]\\)*}\n\\|\\<[a-zA-Z]\\w*([^)]*) *={\\([^}]\\|}[^\n]\\)*}\n\\|\\<[a-zA-Z]\\w*([^)]*) *=\\([^=\\\\\"]\\|\\\\[ \t]*\\(\\\\\\\\.*$\\|/\\*\\([^\\*]\\|\\*[^/]\\)*\\*/\\)?\n\\|\"\\([^\"]*\\|\\\\\"\\)*\"\\)\\([^\\\\\n\"]\\|\"\\([^\"]*\\|\\\\\"\\)*\"\\|\\\\[ \t]*\\(\\\\\\\\.*$\\|/\\*\\([^\\*]\\|\\*[^/]\\)*\\*/\\)?\n\\)*\n\\|\\<[a-zA-Z]\\w*([^)]*)[;\n]"))
  ;; We look at a single line comment, or a long comment,
  ;; or a space/tab/newline character, or a function definition between {},
  ;; or a function definition of the type fun(var)={foo},
  ;; or a function definition not between {}, or a function call.
  ;; And skip them.
    (goto-char (match-end 0)))
  ;; We look whether there is a global-variable being defined here:
  (if (looking-at "\\<\\([a-zA-Z]\\w*\\)=[^=].*$")
      (progn
        (setq answer (cons (match-beginning 1) (match-end 1)))
        (goto-char (match-end 0))))
  answer))

(defsubst gp-search-forward-string-delimiter (lim)
  "Give the position of next \" preceded by an even number
of \\ . Move point after this point. Nil if no such place before lim."
  ;; Inspired from hilit-string-find in hilit19.el.
   (let (p)
        (while (and (setq p (search-forward "\"" lim t))
                    (save-excursion
                      (forward-char -1)
                      (not (zerop (% (skip-chars-backward "\\\\") 2))))))
        p))

(defun gp-find-comment (dummy)
  "A parser to find comments in gp. Called on a gp-program outside
a string or a comment, gives position via (cons start end) of next comment and
set point at the end of line. Answer nil if no comment is found.
DUMMY is not used, but introduced for compatibility with
'hilit-set-mode-patterns"
  ;; Get tricked if one uses the empty string "" in a function-definition
  ;; not enclosed in `{}'. But it *should not* happen!
  ;; Anyway nothing very bad happens then.
  (let ((answer nil) (not-done t))
  (while not-done
    (let ((p-start (point))
          (p-comment
           (re-search-forward "\\\\\\\\\\|/\\*"
                              nil t)))
         (goto-char p-start)
         (if p-comment
            ;; There is a candidate:
            (if (gp-search-forward-string-delimiter (1- p-comment))
               ;; There is a string before the comment.
               ;; Go to end of this string.
               (if (gp-search-forward-string-delimiter (1- p-comment))
                   ;; The string ends before the candidate-comment:
                   nil
                   ;; The string ends after the candidate-comment:
                   (if (gp-search-forward-string-delimiter (point-max))
                       nil
                       ;; Else the file ends on the definition of a string:
                       (setq not-done nil)
                       (goto-char (point-max))))
                ;; There is no string before the comment.
                (setq not-done nil)
                (if (re-search-forward "\\\\\\\\.*$\\|/\\*\\([^\\*]\\|\\*[^/]\\)*\\*/"
                                       nil t)
                    (setq answer (cons (match-beginning 0) (match-end 0)))
                    ;; Else the comment is not properly formed:
                    ))
            ;; There is no candidate:
            (setq not-done nil))))
   answer))

(defun gp-update-hilit nil "Update hilit."
  (interactive)
  (if gp-can-hilit
      ;; Rehilit only the visible part:
      (hilit-rehighlight-region
                (window-start) (min (window-end) (point-max)))))

(defun gp-update-hilit-buffers nil
"Update hilighting/unhilighting on all the buffers
that are in gp-mode or in gp-script-mode."
  (interactive)
  (save-excursion
      (mapcar
      (lambda (abuffer)
              (set-buffer abuffer)
              (if (memq major-mode '(gp-script-mode gp-mode))
                  (if gp-can-hilit (hilit-rehighlight-buffer)
                     (hilit-unhighlight-region
                        (point-min) (point-max)))))
      (buffer-list))
  (message "")))

(defun gp-color-help nil
  (or (not gp-tutorial-requiredp) (gp-show-help (gp-messager 28))))

;;-------------------
;; PART VI : MENU-BAR
;;-------------------

;;---------------
;; MENU BUILDERS
;;---------------

;; Careful to the order! macro should be defined in good order.
;; See backquote.el for definition of 'backquote also (`, and see
;; this same file for (, --> variable 'backquote-unquote-symbol.

(defmacro gp-cmd2-to-paint (gp-place)
  "Build the command to paint gp-place according to a read face-name."
  ;; See the comment attached to 'gp-cmd-to-paint.
  (` (list (list 'lambda nil
          '(interactive)
             (list (function gp-store-wind-conf))
             (list (function gp-color-help))
             (list 'let (list
               (list 'temp-name
               ;; We don't use 'read-face-name because this function
               ;; forces the user to enter a valid face-name. Here,
               ;; if the face-name chosen doesn't exist,
               ;; the default face-name will be used.
                (list (function read-from-minibuffer) (gp-messager 40)))
               (list 'a-face-name nil))
             (list 'setq 'a-face-name
                (list 'intern
                  (list 'if (list 'string= 'temp-name "") '"default"
                          'temp-name)))

             (list 'if (list 'string= 'a-face-name "default")
                (list (function hilit-translate) (, gp-place) nil)
                (list (function hilit-translate) (, gp-place) 'a-face-name))
             (list (function setq) 'pari-colors-modifiedp t)
             (list (function gp-update-hilit-buffers))
             (list (function gp-add-to-gp-colors-list) 'a-face-name)
             ;; In fact, one should add a command here to modify the
             ;; menu-items that presents the colors...
             ;; It is a good deal of code for an almost empty use.
             ;; From this point of view, it was also useless to
             ;; modify 'gp-colors-list above...

             ;; We remove the help.
             (list 'if 'gp-tutorial-requiredp
                (list 'progn
                (list (function gp-window-manager) "*gp-help*"
                      ''gp-remove-help-now-old-config)
                (list (function gp-restore-wind-conf))
             )))))))

(defmacro gp-cmd-to-paint (acolor gp-place)
  "Build the command to paint gp-place to acolor."
  ;; A weird way of programming ... We build a Lisp expression
  ;; which is a function definition. A kind of automatic programming.
  (` (list (list 'lambda nil '(interactive)
             (list (function hilit-translate) (, gp-place)
                                              (list 'quote (, acolor)))
             (list (function setq) 'pari-colors-modifiedp t)
             (list (function gp-update-hilit-buffers))
             (list (function message) "")  ;; Clear the minibuffer
             ))))

(defsubst gp-cmd-to-enable (acolor gp-place)
"Build the command that enable acolor to be chosen in the menu item
[GP gp-place]. A color is enabled if it is not already the one
that is being used for this item."
  ;; See the comment attached to 'gp-cmd-to-paint.
  (list 'and
   'gp-can-hilit
   (list 'not (list 'eq (list 'quote acolor)
                    (list (function gp-place-to-name)
                          (list 'quote gp-place))))))

(defsubst gp-build-color-submenu (gp-place)
  "Build the Colors submenu. The colors proposed are the one of
the list 'gp-colors-list"
  (append
   (mapcar (lambda (acolor)
              (vector
               (symbol-name acolor)
               (gp-cmd-to-paint acolor gp-place)
               (gp-cmd-to-enable acolor gp-place)
               ':key-sequence nil))
           gp-colors-list)
   (list "----------------")
   (list (vector (gp-messager 42) (gp-cmd2-to-paint gp-place) t))))

(defsubst gp-build-color-menu nil
  "Build the Colors menu"
  (if (and (not gp-no-color-item)
           (eq window-system 'x) (x-display-color-p))
  (if (not (eq gp-color-menu-list nil))
  gp-color-menu-list
  (setq gp-color-menu-list
  (list
     (append
        (list (gp-messager 43))
        ;; There is an entry for each pattern to be colored.
        ;; A list of these items can be found in gp-places-list.
        ;; The colors proposed are the ones of 'gp-colors-list.
        ;; The only color that is not choose-able (in grey)
        ;; is the one already used.
        (list (vector (gp-messager 44) 'hilit-recenter t))
        gp-separator
        (mapcar (lambda (quoted-gp-place)
                 (cons
                  (substring
                   (upcase-initials (symbol-name (eval quoted-gp-place)))
                   3)
                  (gp-build-color-submenu (eval quoted-gp-place))))
                gp-places-list)
        (list
        "------------------------------------------"
        ;; In order to save the changes made in the file pari-colors.
        (vector (gp-messager 45) 'gp-save-colors 'pari-colors-modifiedp)
        (vector (gp-messager 46) 'gp-hilit-switch t ':key-sequence nil)
        (vector (gp-messager 47) 'gp-update-hilit-buffers t))))))))

(defconst gp-metakeys-gp-mode-menu
  (list
  (list (gp-messager 48) 
    (vector (gp-messager 49) 'gp-meta-r '(processp gp-process))
    (vector (gp-messager 50) 'gp-meta-w '(processp gp-process))
    "------------------------------------------------"
    (list (gp-messager 51)
      ["Pretty Format"  gp-meta-b (processp gp-process)]
      ["Matrix Pretty Format" gp-meta-m (processp gp-process)]
      ["Raw Format" gp-meta-a (processp gp-process)]
      ["Inner Structure" gp-meta-x (processp gp-process)])
    (list (gp-messager 52)
      (vector (gp-messager 53) 'gp-set-simple-prompt '(processp gp-process)
                               ':key-sequence nil)
      (vector (gp-messager 54) 'gp-set-time-prompt '(processp gp-process)
                               ':key-sequence nil)
      (vector (gp-messager 55) 'gp-set-date-prompt '(processp gp-process)
                               ':key-sequence nil)
      (vector (gp-messager 56) 'gp-set-separator-prompt '(processp gp-process)
                               ':key-sequence nil)
      (vector (gp-messager 42) 'gp-set-prompt '(processp gp-process)))
    "------------------------------------------------"
    ["PARI Types"     gp-meta-t (processp gp-process)]
    ["Default"        gp-meta-d (processp gp-process)]
    ["Version Number" gp-meta-v (processp gp-process)]
    ["Stack Info"     gp-meta-s (processp gp-process)])))

(defconst gp-metakeys-gp-script-mode-menu
  (list
  (list (gp-messager 48)
    ["PARI Types"     gp-meta-t (processp gp-process)]
    ["Default"        gp-meta-d (processp gp-process)]
    ["Version Number" gp-meta-v t])))

(defsubst gp-build-main-cmds-menu nil ""
  (nconc
   (if (equal major-mode 'gp-script-mode)
     (list
      (list (gp-messager 57)
        (vector (gp-messager 58) 'gp-usual-start t)
        (vector (gp-messager 59) 'gp-start-with-parameters
                                   '(not (processp gp-process)))))
     nil)
   (list (vector (gp-messager 60) 'run-gp 't))
   (if (equal major-mode 'gp-script-mode)
       (list (vector (gp-messager 61) 'gp-run-in-region ':enable 'mark-active
                     ':key-sequence nil)) nil)
   (list (vector (gp-messager 62) 'gp-meta-q '(processp gp-process)
                     ':key-sequence nil))))

(defconst gp-manual-menu
  (nconc
   (if (eq window-system 'x)
     (list ["Browser" gp-browser (eq window-system 'x) :key-sequence nil])
     nil)
   (list
   ["Info Survey" gp-menu t]                            ; Text info
   ["TeX Manual" gpman t :key-sequence nil]             ; TeX  info
   ["Tutorial" gp-tutorial t :key-sequence nil]         ; TeX  info
   "-------------------------"
   ["Info on Function..." gp-get-man-entry t]           ; Text info
   ["Info on Subject..." gp-get-apropos t]              ; Text info
   ["TeX Info on ..." gp-get-TeX-man-entry t :key-sequence nil] ; TeX  info
   "-------------------------"
   (vector (gp-messager 63) 'gp-show-pariemacs 't ':key-sequence nil))))

(defsubst gp-build-cpl-file-menu nil ""
  (list
    (nconc
      (list (gp-messager 64)
       (vector (gp-messager 65) 'gp-cpl-file ':enable t ':key-sequence nil)
       (vector (gp-messager 66) 'gp-edit-cpl-file
                                ':enable t ':key-sequence nil))
       (if (equal major-mode 'gp-script-mode)
         (list (vector (gp-messager 67) 'gp-make-cpl-file
                       ':enable t ':key-sequence nil)
               ["Info" gp-cpl-file-info :enable t :key-sequence nil]) nil))))

(defsubst gp-build-utilities-menu nil ""
  (nconc
    (list (vector (gp-messager 72) 'gp-complete t))
    (list (vector (gp-messager 73) 'gp-skip-to-error t))
    (if (equal major-mode 'gp-mode)
        (list
        (list (gp-messager 74)
         (vector (gp-messager 75) 'gp-copy-last-input '(processp gp-process))
         (vector (gp-messager 76) 'gp-remove-last-output t)
         (vector (gp-messager 77) 'gp-remove-last-action t)))
        nil)
    (if (equal major-mode 'gp-mode)
        (list (vector (gp-messager 78) 'gp-toggle t)) nil)
    ))

;;--------------------------------------
;; MENU-BAR ITEM USED IN GP-SCRIPT-MODE
;;--------------------------------------

(defun gp-init-script-menu-bar nil
  "Add menu-bar item GP if wanted and possible."
  (if (and (featurep 'easymenu) (not gp-no-menu-bar)
           (eq GP-script-menu-map nil))
     (easy-menu-define GP-script-menu-map gp-script-map
      "Menu-bar item used under gp-script-mode."
      (append
        (list "GP")
        (gp-build-main-cmds-menu)                       gp-separator
        gp-manual-menu                                  gp-separator
        gp-metakeys-gp-script-mode-menu
        (gp-build-color-menu)
        (list (vector (gp-messager 70) 'gp-tutorial-switch t)) gp-separator
        (gp-build-utilities-menu)                       gp-separator
        (gp-build-cpl-file-menu)
        (list (vector (gp-messager 71) 'gp-restore-wind-conf
                                       'gp-registers-list))
        ))))

;;-------------------------------
;; MENU-BAR ITEM USED IN GP-MODE
;;-------------------------------

(defun gp-init-menu-bar nil
  "Add menu-bar item GP if wanted and possible."
  (if (and (featurep 'easymenu) (not gp-no-menu-bar)
           (eq GP-menu-map nil))
     (easy-menu-define GP-menu-map gp-map
      "Menu-bar item used under gp-mode."
      (append
        (list "GP")
        (gp-build-main-cmds-menu)                       gp-separator
        gp-manual-menu                                  gp-separator
        gp-metakeys-gp-mode-menu
        (gp-build-color-menu)
        (list (vector (gp-messager 70) 'gp-tutorial-switch 't)) gp-separator
        (gp-build-utilities-menu)                       gp-separator
        (gp-build-cpl-file-menu)
        (list (vector (gp-messager 71) 'gp-restore-wind-conf
                                       'gp-registers-list))))))

;;; pari.el ends here   ----------3797 lines
