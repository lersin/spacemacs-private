;;; Code:
(defgroup goenv nil
  "Golang Temporary Workspace Environment Interface."
  :prefix "goenv-"
  :group 'languages)

(defvar goenv-default-goroot "/usr/local/Cellar/go/1.18.2/libexec"
  "The default goroot")

(defvar goenv-temporary-env nil
  "The current go template workspace environment. Do not set this variable directly;
  use `goenv-activate'.")

(defvar goenv-old-go-root nil
  "The old GOROOT environment before the last activate.")

;;; autoload
(defun goenv-activate (directory)
  "Change go env GOROOT to Default."
  (interactive "DSet goenv GOROOT to Default")
  (goenv-deactivate)

  (setq goenv-old-go-root (getenv "GOROOT"))

  ;;(setenv "GOROOT" goenv-default-goroot)
  (if (getenv "GOROOT")
      nil
      (setenv "GOROOT" goenv-default-goroot))
      (if (string= (getenv "GOROOT") goenv-default-goroot)
	  nil
          (setenv "GOROOT" goenv-default-goroot))
  (message "New goroot = %s" (getenv "GOROOT"))
  (setq goenv-temporary-env t)
)

;;; autoload
(defun goenv-deactivate ()
  "Deactivate any current go temporary workspace environment."
  (interactive "DSet goenv GOROOT to old")
  (when goenv-old-go-root
    (setenv "GOROOT" goenv-old-go-root)
    (setq goenv-old-go-root nil))
  (setq goenv-temporary-env nil)
 )

(provide 'goenv)

;; cheatsheet-show 默认是垂直分屏
;; cheatsheet-below 把垂直分屏改为水平分屏
(defun cheatsheet-below ()
  "把左右两屏调整为上下两屏.
       A
A|B => -
       B"
  (interactive)
  (let ((buf (current-buffer)))
    ;; 选中左侧 window
    (select-window (frame-first-window))
    ;; 删掉右侧 window
    (delete-other-windows)
    ;; 分屏、选中下边 window
    (select-window (split-window-below))
    ;; 切换至最近 buffer
    (switch-to-buffer (other-buffer))
    ;; 选中原来 buffer 所在的 window
    (select-window (get-buffer-window buf))))
