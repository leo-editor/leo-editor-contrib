<?xml version="1.0" encoding="UTF-8"?>
<leo_file>
<leo_header file_format="2" tnodes="0" max_tnode_index="51" clone_windows="0"/>
<globals body_outline_ratio="0.5">
	<global_window_position top="215" left="388" height="600" width="800"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences allow_rich_text="0">
</preferences>
<find_panel_settings>
	<find_string></find_string>
	<change_string></change_string>
</find_panel_settings>
<vnodes>
<v t="T1" a="EV"><vh>@file pymacs.el</vh>
<v t="T2"><vh>Intro</vh>
<v t="T3"><vh>&lt;&lt; free software stuff &gt;&gt;</vh></v>
</v>
<v t="T4"><vh>Published functions...</vh>
<v><vh>vars...</vh>
<v t="T5"><vh>var pymacs-load-path</vh></v>
<v t="T6"><vh>var pymacs-trace-transit</vh></v>
<v t="T7"><vh>var pymacs-forget-mutability</vh></v>
<v t="T8"><vh>var pymacs-mutable-strings</vh></v>
<v t="T9"><vh>var pymacs-timeout-at-start</vh></v>
<v t="T10"><vh>var pymacs-timeout-at-reply</vh></v>
<v t="T11"><vh>var pymacs-timeout-at-line</vh></v>
</v>
<v t="T12"><vh>pymacs-load</vh></v>
<v t="T13"><vh>pymacs-eval</vh></v>
<v t="T14"><vh>pymacs-exec</vh></v>
<v t="T15"><vh>pymacs-call</vh></v>
<v t="T16"><vh>pymacs-apply</vh></v>
</v>
<v t="T17"><vh>Integration details...</vh>
<v t="T18"><vh>defadvice</vh></v>
<v t="T19"><vh>pymacs-python-reference</vh></v>
</v>
<v t="T20"><vh>experimental...</vh>
<v t="T21"><vh>pymacs-file-handler</vh></v>
<v t="T22"><vh>pymacs-file-force</vh></v>
</v>
<v t="T23"><vh>Gargabe collection of Python IDs...</vh>
<v><vh>vars...</vh>
<v t="T24"><vh>var pymacs-use-hash-tables</vh></v>
<v t="T25"><vh>var pymacs-used-ids</vh></v>
<v t="T26"><vh>var pymacs-weak-hash</vh></v>
<v t="T27"><vh>var pymacs-gc-wanted</vh></v>
<v t="T28"><vh>var pymacs-gc-running</vh></v>
<v t="T29"><vh>var pymacs-gc-timer</vh></v>
</v>
<v t="T30"><vh>pymacs-schedule-gc</vh></v>
<v t="T31"><vh>pymacs-garbage-collect</vh></v>
<v t="T32"><vh>pymacs-defuns</vh></v>
<v t="T33"><vh>pymacs-defun</vh></v>
<v t="T34"><vh>pymacs-python</vh></v>
</v>
<v t="T35"><vh>Generating Python code...</vh>
<v t="T36"><vh>var pymacs-lisp</vh></v>
<v t="T37"><vh>var pymacs-freed-list</vh></v>
<v t="T38"><vh>pymacs-allocate-lisp</vh></v>
<v t="T39"><vh>pymacs-free-lisp</vh></v>
<v t="T40"><vh>pymacs-print-for-apply-expanded</vh></v>
<v t="T41"><vh>pymacs-print-for-apply</vh></v>
<v t="T42"><vh>pymacs-print-for-eval</vh></v>
</v>
<v t="T43"><vh>Communication protocol...</vh>
<v t="T44"><vh>pymacs-start-services</vh></v>
<v t="T45"><vh>pymacs-terminate-services</vh></v>
<v t="T46"><vh>pymacs-reply</vh></v>
<v t="T47"><vh>pymacs-error</vh></v>
<v t="T48"><vh>pymacs-expand</vh></v>
<v t="T49"><vh>pymacs-serve-until-reply</vh></v>
<v t="T50"><vh>pymacs-round-trip</vh></v>
<v t="T51"><vh>pymacs-proper-list-p</vh></v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="T1">@ignore
@language elisp

@others

(provide 'pymacs)</t>
<t tx="T2">;;; Interface between Emacs Lisp and Python - Lisp part.    -*- emacs-lisp -*-
;;; Copyright © 2001, 2002, 2003 Progiciels Bourbeau-Pinard inc.
;;; François Pinard &lt;pinard@iro.umontreal.ca&gt;, 2001.

&lt;&lt; free software stuff &gt;&gt;

;;; See the Pymacs documentation (in `README') for more information.</t>
<t tx="T3">
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 2, or (at your option)
;;; any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software Foundation,
;;; Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.</t>
<t tx="T4">;;; Published functions.</t>
<t tx="T5">(defvar pymacs-load-path nil
  "List of additional directories to search for Python modules.
The directories listed will be searched first, in the order given.")</t>
<t tx="T6">(defvar pymacs-trace-transit '(5000 . 30000)

"Keep the communication buffer growing, for debugging.
When this variable is nil, the `*Pymacs*' communication buffer gets erased
before each communication round-trip.  Setting it to `t' guarantees that
the full communication is saved, which is useful for debugging.
It could also be given as (KEEP . LIMIT): whenever the buffer exceeds LIMIT
bytes, it is reduced to approximately KEEP bytes.")</t>
<t tx="T7">(defvar pymacs-forget-mutability nil
  "Transmit copies to Python instead of Lisp handles, as much as possible.
When this variable is nil, most mutable objects are transmitted as handles.
This variable is meant to be temporarily rebound to force copies.")</t>
<t tx="T8">(defvar pymacs-mutable-strings nil
  "Prefer transmitting Lisp strings to Python as handles.
When this variable is nil, strings are transmitted as copies, and the
Python side thus has no way for modifying the original Lisp strings.
This variable is ignored whenever `forget-mutability' is set.")</t>
<t tx="T9">(defvar pymacs-timeout-at-start 30
  "Maximum reasonable time, in seconds, for starting `pymacs-services'.
A machine should be pretty loaded before one needs to increment this.")</t>
<t tx="T10">(defvar pymacs-timeout-at-reply 5
  "Expected maximum time, in seconds, to get the first line of a reply.
The status of `pymacs-services' is checked at every such timeout.")</t>
<t tx="T11">(defvar pymacs-timeout-at-line 2
  "Expected maximum time, in seconds, to get another line of a reply.
The status of 'pymacs-services' is checked at every such timeout.")</t>
<t tx="T12">(defun pymacs-load (module &amp;optional prefix noerror)

  "Import the Python module named MODULE into Emacs.
Each function in the Python module is made available as an Emacs function.
The Lisp name of each function is the concatenation of PREFIX with
the Python name, in which underlines are replaced by dashes.  If PREFIX is
not given, it defaults to MODULE followed by a dash.
If NOERROR is not nil, do not raise error when the module is not found."

  (interactive
   (let* ((module (read-string "Python module? "))
	  (default (concat (car (last (split-string module "\\."))) "-"))
	  (prefix (read-string (format "Prefix? [%s] " default)
			       nil nil default)))
     (list module prefix)))
  (message "Pymacs loading %s..." module)
  (let ((lisp-code (pymacs-call "pymacs_load_helper" module prefix)))
    (cond (lisp-code (let ((result (eval lisp-code)))
		       (message "Pymacs loading %s...done" module)
		       result))
	  (noerror (message "Pymacs loading %s...failed" module) nil)
	  (t (error "Pymacs loading %s...failed" module)))))</t>
<t tx="T13">(defun pymacs-eval (text)

  "Compile TEXT as a Python expression, and return its value."
 
  (interactive "sPython expression? ")
  (let ((value (pymacs-call "eval" text)))
    (when (interactive-p)
      (message "%S" value))
    value))</t>
<t tx="T14">(defun pymacs-exec (text)

"Compile and execute TEXT as a sequence of Python statements.
This functionality is experimental, and does not appear to be useful."

  (interactive "sPython statements? ")
  (let ((value (pymacs-serve-until-reply
		`(progn (princ "exec ") (prin1 ,text)))))
    (when (interactive-p)
      (message "%S" value))
    value))</t>
<t tx="T15">(defun pymacs-call (function &amp;rest arguments)

"Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS are separate
Lisp expressions, one per argument.  Immutable Lisp constants are converted
to Python equivalents, other structures are converted into Lisp handles."

  (pymacs-serve-until-reply `(pymacs-print-for-apply ',function ',arguments)))</t>
<t tx="T16">(defun pymacs-apply (function arguments)

"Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS is a list of
Lisp expressions.  Immutable Lisp constants are converted to Python
equivalents, other structures are converted into Lisp handles."

  (pymacs-serve-until-reply `(pymacs-print-for-apply ',function ',arguments)))</t>
<t tx="T17">;;; Integration details.</t>
<t tx="T18">;; Python functions and modules should ideally look like Lisp functions and
;; modules.  This page tries to increase the integration seamlessness.

(defadvice documentation (around pymacs-ad-documentation activate)
  ;; Integration of doc-strings.
  (let* ((reference (pymacs-python-reference function))
	 (python-doc (when reference
		       (pymacs-eval (format "doc_string(%s)" reference)))))
    (if (or reference python-doc)
	(setq ad-return-value
	      (concat
	       "It interfaces to a Python function.\n\n"
	       (when python-doc
		 (if raw python-doc (substitute-command-keys python-doc)))))
      ad-do-it)))
</t>
<t tx="T19">(defun pymacs-python-reference (object)
  ;; Return the text reference of a Python object if possible, else nil.
  (when (functionp object)
    (let* ((definition (indirect-function object))
	   (body (and (pymacs-proper-list-p definition)
		      (&gt; (length definition) 2)
		      (eq (car definition) 'lambda)
		      (cddr definition))))
      (when (and body (listp (car body)) (eq (caar body) 'interactive))
	;; Skip the interactive specification of a function.
	(setq body (cdr body)))
      (when (and body
		 ;; Advised functions start with a string.
		 (not (stringp (car body)))
		 ;; Python trampolines hold exactly one expression.
		 (= (length body) 1))
	(let ((expression (car body)))
	  ;; EXPRESSION might now hold something like:
	  ;;    (pymacs-apply (quote (pymacs-python . N)) ARGUMENT-LIST)
	  (when (and (pymacs-proper-list-p expression)
		     (= (length expression) 3)
		     (eq (car expression) 'pymacs-apply)
		     (eq (car (cadr expression)) 'quote))
	    (setq object (cadr (cadr expression))))))))
  (when (eq (car-safe object) 'pymacs-python)
    (format "python[%d]" (cdr object))))</t>
<t tx="T20">;; The following functions are experimental -- they are not satisfactory yet.

</t>
<t tx="T21">(defun pymacs-file-handler (operation &amp;rest arguments)
  ;; Integration of load-file, autoload, etc.
  ;; Emacs might want the contents of some `MODULE.el' which does not exist,
  ;; while there is a `MODULE.py' or `MODULE.pyc' file in the same directory.
  ;; The goal is to generate a virtual contents for this `MODULE.el' file, as
  ;; a set of Lisp trampoline functions to the Python module functions.
  ;; Python modules can then be loaded or autoloaded as if they were Lisp.
  ;(message "** %S %S" operation arguments)
  (cond ((and (eq operation 'file-readable-p)
	      (let ((module (substring (car arguments) 0 -3)))
		(or (pymacs-file-force operation arguments)
		    (file-readable-p (concat module ".py"))
		    (file-readable-p (concat module ".pyc"))))))
	((and (eq operation 'load)
	      (not (pymacs-file-force
		    'file-readable-p (list (car arguments))))
	      (file-readable-p (car arguments)))
	 (let ((lisp-code (pymacs-call "pymacs_load_helper"
				       (substring (car arguments) 0 -3)
				       nil)))
	   (unless lisp-code
	     (error "Python import error"))
	   (eval lisp-code)))
	((and (eq operation 'insert-file-contents)
	      (not (pymacs-file-force
		    'file-readable-p (list (car arguments))))
	      (file-readable-p (car arguments)))
	 (let ((lisp-code (pymacs-call "pymacs_load_helper"
				       (substring (car arguments) 0 -3)
				       nil)))
	   (unless lisp-code
	     (error "Python import error"))
	   (insert (prin1-to-string lisp-code))))
	(t (pymacs-file-force operation arguments))))</t>
<t tx="T22">(defun pymacs-file-force (operation arguments)
  ;; Bypass the file handler.
  (let ((inhibit-file-name-handlers
	 (cons 'pymacs-file-handler
	       (and (eq inhibit-file-name-operation operation)
		    inhibit-file-name-handlers)))
	(inhibit-file-name-operation operation))
    (apply operation arguments)))
	
;(add-to-list 'file-name-handler-alist '("\\.el\\'" . pymacs-file-handler))</t>
<t tx="T23">;;; Gargabe collection of Python IDs.

;; Python objects which have no Lisp representation are allocated on the
;; Python side as `python[INDEX]', and INDEX is transmitted to Emacs, with
;; the value to use on the Lisp side for it.  Whenever Lisp does not need a
;; Python object anymore, it should be freed on the Python side.  The
;; following variables and functions are meant to fill this duty.

</t>
<t tx="T24">(defvar pymacs-use-hash-tables nil
  "Automatically set to t if hash tables are available.")</t>
<t tx="T25">(defvar pymacs-used-ids nil
  "List of received IDs, currently allocated on the Python side.")</t>
<t tx="T26">(defvar pymacs-weak-hash nil
  "Weak hash table, meant to find out which IDs are still needed.")</t>
<t tx="T27">(defvar pymacs-gc-wanted nil
  "Flag if it is time to clean up unused IDs on the Python side.")</t>
<t tx="T28">(defvar pymacs-gc-running nil
  "Flag telling that a Pymacs garbage collection is in progress.")</t>
<t tx="T29">(defvar pymacs-gc-timer nil
  "Timer to trigger Pymacs garbage collection at regular time intervals.
The timer is used only if `post-gc-hook' is not available.")</t>
<t tx="T30">(defun pymacs-schedule-gc ()
  (unless pymacs-gc-running
    (setq pymacs-gc-wanted t)))</t>
<t tx="T31">(defun pymacs-garbage-collect ()
  ;; Clean up unused IDs on the Python side.
  (when pymacs-use-hash-tables
    (let ((pymacs-gc-running t)
	  (pymacs-forget-mutability t)
	  (ids pymacs-used-ids)
	  used-ids unused-ids)
      (while ids
	(let ((id (car ids)))
	  (setq ids (cdr ids))
	  (if (gethash id pymacs-weak-hash)
	      (setq used-ids (cons id used-ids))
	    (setq unused-ids (cons id unused-ids)))))
      ;;(message "** pymacs-garbage-collect %d %d"
      ;;         (length used-ids) (length unused-ids))
      (setq pymacs-used-ids used-ids
	    pymacs-gc-wanted nil)
      (when unused-ids
	(pymacs-apply "free_python" unused-ids)))))</t>
<t tx="T32">(defun pymacs-defuns (arguments)
  ;; Take one argument, a list holding a number of items divisible by 3.  The
  ;; first argument is an INDEX, the second is a NAME, the third is the
  ;; INTERACTION specification, and so forth.  Register Python INDEX with a
  ;; function with that NAME and INTERACTION on the Lisp side.  The strange
  ;; calling convention is to minimise quoting at call time.
  (while (&gt;= (length arguments) 3)
    (let ((index (nth 0 arguments))
	  (name (nth 1 arguments))
	  (interaction (nth 2 arguments)))
      (fset name (pymacs-defun index interaction))
      (setq arguments (nthcdr 3 arguments)))))</t>
<t tx="T33">(defun pymacs-defun (index interaction)
  ;; Register INDEX on the Lisp side with a Python object that is a function,
  ;; and return a lambda form calling that function.  If the INTERACTION
  ;; specification is nil, the function is not interactive.  Otherwise, the
  ;; function is interactive, INTERACTION is then either a string, or the
  ;; index of an argument-less Python function returning the argument list.
  (let ((object (pymacs-python index)))
    (cond ((null interaction)
	   `(lambda (&amp;rest arguments)
	      (pymacs-apply ',object arguments)))
	  ((stringp interaction)
	   `(lambda (&amp;rest arguments)
	      (interactive ,interaction)
	      (pymacs-apply ',object arguments)))
	  (t `(lambda (&amp;rest arguments)
		(interactive (pymacs-call ',(pymacs-python interaction)))
		(pymacs-apply ',object arguments))))))</t>
<t tx="T34">(defun pymacs-python (index)
  ;; Register on the Lisp side a Python object having INDEX, and return it.
  ;; The result is meant to be recognised specially by `print-for-eval', and
  ;; in the function position by `print-for-apply'.
  (let ((object (cons 'pymacs-python index)))
    (when pymacs-use-hash-tables
      (puthash index object pymacs-weak-hash)
      (setq pymacs-used-ids (cons index pymacs-used-ids)))
    object))</t>
<t tx="T35">;;; Generating Python code.

;; Many Lisp expressions cannot fully be represented in Python, at least
;; because the object is mutable on the Lisp side.  Such objects are allocated
;; somewhere into a vector of handles, and the handle index is used for
;; communication instead of the expression itself.


</t>
<t tx="T36">(defvar pymacs-lisp nil
  "Vector of handles to hold transmitted expressions.")</t>
<t tx="T37">(defvar pymacs-freed-list nil
  "List of unallocated indices in Lisp.")</t>
<t tx="T38">;; When the Python CG is done with a Lisp object, a communication occurs so to
;; free the object on the Lisp side as well.

(defun pymacs-allocate-lisp (expression)
  ;; This function allocates some handle for an EXPRESSION, and return its
  ;; index.
  (unless pymacs-freed-list
    (let* ((previous pymacs-lisp)
	   (old-size (length previous))
	   (new-size (if (zerop old-size) 100 (+ old-size (/ old-size 2))))
	   (counter new-size))
      (setq pymacs-lisp (make-vector new-size nil))
      (while (&gt; counter 0)
	(setq counter (1- counter))
	(if (&lt; counter old-size)
	    (aset pymacs-lisp counter (aref previous counter))
	  (setq pymacs-freed-list (cons counter pymacs-freed-list))))))
  (let ((index (car pymacs-freed-list)))
    (setq pymacs-freed-list (cdr pymacs-freed-list))
    (aset pymacs-lisp index expression)
    index))</t>
<t tx="T39">(defun pymacs-free-lisp (&amp;rest indices)
  ;; This function is triggered from Python side for Lisp handles which lost
  ;; their last reference.  These references should be cut on the Lisp side as
  ;; well, or else, the objects will never be garbage-collected.
  (while indices
    (let ((index (car indices)))
      (aset pymacs-lisp index nil)
      (setq pymacs-freed-list (cons index pymacs-freed-list)
	    indices (cdr indices)))))</t>
<t tx="T40">(defun pymacs-print-for-apply-expanded (function arguments)
  ;; This function acts like `print-for-apply', but produce arguments which
  ;; are expanded copies whenever possible, instead of handles.  Proper lists
  ;; are turned into Python lists, vectors are turned into Python tuples.
  (let ((pymacs-forget-mutability t))
    (pymacs-print-for-apply function arguments)))</t>
<t tx="T41">(defun pymacs-print-for-apply (function arguments)
  ;; This function prints a Python expression calling FUNCTION, which is a
  ;; string naming a Python function, or a Python reference, over all its
  ;; ARGUMENTS, which are Lisp expressions.
  (let ((separator "")
	argument)
    (if (eq (car-safe function) 'pymacs-python)
	(princ (format "python[%d]" (cdr function)))
      (princ function))
    (princ "(")
    (while arguments
      (setq argument (car arguments)
	    arguments (cdr arguments))
      (princ separator)
      (setq separator ", ")
      (pymacs-print-for-eval argument))
    (princ ")")))</t>
<t tx="T42">(defun pymacs-print-for-eval (expression)
  ;; This function prints a Python expression out of a Lisp EXPRESSION.
  (let (done)
    (cond ((not expression)
	   (princ "None")
	   (setq done t))
	  ((numberp expression)
	   (princ expression)
	   (setq done t))
	  ((stringp expression)
	   (when (or pymacs-forget-mutability
		     (not pymacs-mutable-strings))
	     (let ((text (copy-sequence expression)))
	       (set-text-properties 0 (length text) nil text)
	       (princ (mapconcat 'identity
				 (split-string (prin1-to-string text) "\n")
				 "\\n")))
	     (setq done t)))
	  ((symbolp expression)
	   (let ((name (symbol-name expression)))
	     ;; The symbol can only be transmitted when in the main oblist.
	     (when (eq expression (intern-soft name))
	       (cond
		((save-match-data
		   (string-match "^[A-Za-z][-A-Za-z0-9]*$" name))
		 (princ "lisp.")
		 (princ (mapconcat 'identity (split-string name "-") "_")))
		(t (princ "lisp[")
		   (prin1 name)
		   (princ "]")))
	       (setq done t))))
	  ((vectorp expression)
	   (when pymacs-forget-mutability
	     (let ((limit (length expression))
		   (counter 0))
	       (princ "(")
	       (while (&lt; counter limit)
		 (unless (zerop counter)
		   (princ ", "))
		 (pymacs-print-for-eval (aref expression counter))
		 (setq counter (1+ counter)))
	       (when (= limit 1)
		 (princ ","))
	       (princ ")")
	       (setq done t))))
	  ((eq (car-safe expression) 'pymacs-python)
	   (princ "python[")
	   (princ (cdr expression))
	   (princ "]")
	   (setq done t))
	  ((pymacs-proper-list-p expression)
	   (when pymacs-forget-mutability
	     (princ "[")
	     (pymacs-print-for-eval (car expression))
	     (while (setq expression (cdr expression))
	       (princ ", ")
	       (pymacs-print-for-eval (car expression)))
	     (princ "]")
	     (setq done t))))
    (unless done
      (let ((class (cond ((vectorp expression) "Vector")
			 ((and pymacs-use-hash-tables
			       (hash-table-p expression))
			  "Table")
			 ((bufferp expression) "Buffer")
			 ((pymacs-proper-list-p expression) "List")
			 (t "Lisp"))))
	(princ class)
	(princ "(")
	(princ (pymacs-allocate-lisp expression))
	(princ ")")))))</t>
<t tx="T43">;;; Communication protocol.

(defvar pymacs-transit-buffer nil
  "Communication buffer between Emacs and Python.")
  
;; The principle behind the communication protocol is that it is easier to
;; generate than parse, and that each language already has its own parser.

;; So, the Emacs side generates Python text for the Python side to interpret,
;; while the Python side generates Lisp text for the Lisp side to interpret.
;; About nothing but expressions are transmitted, which are evaluated on
;; arrival.  The pseudo `reply' function is meant to signal the final result
;; of a series of exchanges following a request, while the pseudo `error'
;; function is meant to explain why an exchange could not have been completed.

;; The protocol itself is rather simple, and contains human readable text
;; only.  A message starts at the beginning of a line in the communication
;; buffer, either with `&gt;' for the Lisp to Python direction, or `&lt;' for the
;; Python to Lisp direction.  This is followed by a decimal number giving the
;; length of the message text, a TAB character, and the message text itself.
;; Message direction alternates systematically between messages, it never
;; occurs that two successive messages are sent in the same direction.  The
;; first message is received from the Python side, it is `(version VERSION)'.
</t>
<t tx="T44">(defun pymacs-start-services ()
  ;; This function gets called automatically, as needed.
  (let ((buffer (get-buffer-create "*Pymacs*")))
    (with-current-buffer buffer
      (buffer-disable-undo)
      (save-match-data
	;; Launch the Python helper.
	(let ((process (apply 'start-process "pymacs" buffer "pymacs-services"
			      (mapcar 'expand-file-name pymacs-load-path))))
	  (process-kill-without-query process)
	  ;; Receive the synchronising reply.
	  (while (progn
		   (goto-char (point-min))
		   (not (re-search-forward "&lt;\\([0-9]+\\)\t" nil t)))
	    (unless (accept-process-output process pymacs-timeout-at-start)
	      (error "Pymacs helper did not start within %d seconds."
		     pymacs-timeout-at-start)))
	  (let ((marker (process-mark process))
		(limit-position (+ (match-end 0)
				   (string-to-number (match-string 1)))))
	    (while (&lt; (marker-position marker) limit-position)
	      (unless (accept-process-output process pymacs-timeout-at-start)
		(error "Pymacs helper probably was interrupted at start.")))))
	;; Check that synchronisation occurred.
	(goto-char (match-end 0))
	(let ((reply (read (current-buffer))))
	  (if (and (pymacs-proper-list-p reply)
		   (= (length reply) 2)
		   (eq (car reply) 'pymacs-version))
	      (unless (string-equal (cadr reply) "0.22")
		(error "Pymacs Lisp version is 0.22, Python is %s."
		       (cadr reply)))
	    (error "Pymacs got an invalid initial reply.")))))
    (setq pymacs-use-hash-tables (and (fboundp 'make-hash-table)
				      (fboundp 'gethash)
				      (fboundp 'puthash)))
    (when pymacs-use-hash-tables
      (if pymacs-weak-hash
	  ;; A previous Pymacs session occurred in *this* Emacs session.  Some
	  ;; IDs may hang around, which do not correspond to anything on the
	  ;; Python side.  Python should not recycle such IDs for new objects.
	  (when pymacs-used-ids
	    (let ((pymacs-transit-buffer buffer)
		  (pymacs-forget-mutability t))
	      (pymacs-apply "zombie_python" pymacs-used-ids)))
	(setq pymacs-weak-hash (make-hash-table :weakness 'value)))
      (if (boundp 'post-gc-hook)
	  (add-hook 'post-gc-hook 'pymacs-schedule-gc)
	(setq pymacs-gc-timer (run-at-time 20 20 'pymacs-schedule-gc))))
    ;; If nothing failed, only then declare that Pymacs has started!
    (setq pymacs-transit-buffer buffer)))</t>
<t tx="T45">(defun pymacs-terminate-services ()
  ;; This function is mainly provided for documentation purposes.
  (interactive)
  (garbage-collect)
  (pymacs-garbage-collect)
  (when (or (not pymacs-used-ids)
	    (yes-or-no-p "\
Killing the helper might create zombie objects.  Kill? "))
    (cond ((boundp 'post-gc-hook)
	   (remove-hook 'post-gc-hook 'pymacs-schedule-gc))
	  ((timerp pymacs-gc-timer)
	   (cancel-timer pymacs-gc-timer)))
    (when pymacs-transit-buffer
      (kill-buffer pymacs-transit-buffer))
    (setq pymacs-gc-running nil
	  pymacs-gc-timer nil
	  pymacs-transit-buffer nil
	  pymacs-lisp nil
	  pymacs-freed-list nil)))</t>
<t tx="T46">(defun pymacs-reply (expression)
  ;; This pseudo-function returns `(pymacs-reply . EXPRESSION)'.
  ;; It is only used from within the `loop' function on the Python side.
  ;; `serve-until-reply' later recognises this form.
  (cons 'pymacs-reply expression))</t>
<t tx="T47">(defun pymacs-error (expression)
  ;; This pseudo-function returns `(pymacs-error . EXPRESSION)'.
  ;; It is only used from within the `loop' function on the Python side.
  ;; `serve-until-reply' later recognises this form.
  (cons 'pymacs-error expression))</t>
<t tx="T48">(defun pymacs-expand (expression)
  ;; This pseudo-function returns `(pymacs-expand . EXPRESSION)'.  It is
  ;; only called from the `loop' function within `Pymacs/pymacs.py'.
  ;; `serve-until-reply' later recognises this form.
  (cons 'pymacs-expand expression))</t>
<t tx="T49">(defun pymacs-serve-until-reply (inserter)
  ;; This function evals INSERTER to print a Python request.  It sends it to
  ;; the Python helper, and serves all sub-requests coming from the
  ;; Python side, until either a reply or an error is finally received.
  (unless (and pymacs-transit-buffer
	       (buffer-name pymacs-transit-buffer)
	       (get-buffer-process pymacs-transit-buffer))
    (pymacs-start-services))
  (when pymacs-gc-wanted
    (pymacs-garbage-collect))
  (let (done value)
    (while (not done)
      (let* ((text (pymacs-round-trip inserter))
	     (reply (condition-case info
			(eval text)
		      (error (cons 'pymacs-oops (prin1-to-string info))))))
	(cond ((not (consp reply))
	       (setq inserter `(pymacs-print-for-apply 'reply '(,reply))))
	      ((eq 'pymacs-reply (car reply))
	       (setq done t value (cdr reply)))
	      ((eq 'pymacs-error (car reply))
	       (error "Python: %s" (cdr reply)))
	      ((eq 'pymacs-expand (car reply))
	       (setq inserter `(pymacs-print-for-apply-expanded
				'reply '(,(cdr reply)))))
	      ((eq 'pymacs-oops (car reply))
	       (setq inserter `(pymacs-print-for-apply
				'error '(,(cdr reply)))))
	      (t (setq inserter `(pymacs-print-for-apply 'reply '(,reply)))))))
    value))</t>
<t tx="T50">(defun pymacs-round-trip (inserter)
  ;; This function evals INSERTER to print a Python request.  It sends it to
  ;; the Python helper, awaits for any kind of reply, and returns it.
  (with-current-buffer pymacs-transit-buffer
    ;; Possibly trim the beginning of the transit buffer.
    (cond ((not pymacs-trace-transit)
	   (erase-buffer))
	  ((consp pymacs-trace-transit)
	   (when (&gt; (buffer-size) (cdr pymacs-trace-transit))
	     (let ((cut (- (buffer-size) (car pymacs-trace-transit))))
	       (when (&gt; cut 0)
		 (save-excursion
		   (goto-char cut)
		   (unless (memq (preceding-char) '(0 ?\n))
		     (forward-line 1))
		   (delete-region (point-min) (point))))))))
    ;; Send the request, wait for a reply, and process it.
    (let* ((process (get-buffer-process pymacs-transit-buffer))
	   (status (process-status process))
	   (marker (process-mark process))
	   (moving (= (point) marker))
	   send-position reply-position reply)
      (save-excursion
	(save-match-data
	  ;; Encode request.
	  (setq send-position (marker-position marker))
	  (let ((standard-output marker))
	    (eval inserter))
	  (goto-char marker)
	  (unless (= (preceding-char) ?\n)
	    (princ "\n" marker))
	  ;; Send request text.
	  (goto-char send-position)
	  (insert (format "&gt;%d\t" (- marker send-position)))
	  (setq reply-position (marker-position marker))
	  (process-send-region process send-position marker)
	  ;; Receive reply text.
	  (while (and (eq status 'run)
		      (progn
			(goto-char reply-position)
			(not (re-search-forward "&lt;\\([0-9]+\\)\t" nil t))))
	    (unless (accept-process-output process pymacs-timeout-at-reply)
	      (setq status (process-status process))))
	  (when (eq status 'run)
	    (let ((limit-position (+ (match-end 0)
				     (string-to-number (match-string 1)))))
	      (while (and (eq status 'run)
			  (&lt; (marker-position marker) limit-position))
		(unless (accept-process-output process pymacs-timeout-at-line)
		  (setq status (process-status process))))))
	  ;; Decode reply.
	  (if (not (eq status 'run))
	      (error "Pymacs helper status is `%S'." status)
	    (goto-char (match-end 0))
	    (setq reply (read (current-buffer))))))
      (when (and moving (not pymacs-trace-transit))
	(goto-char marker))
      reply)))</t>
<t tx="T51">(defun pymacs-proper-list-p (expression)
  ;; Tell if a list is proper, id est, that it is `nil' or ends with `nil'.
  (cond ((not expression))
	((consp expression) (not (cdr (last expression))))))</t>
</tnodes>
</leo_file>
