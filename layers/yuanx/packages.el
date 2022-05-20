;;; packages.el --- yuanx layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: YiddishKop <guanghui8827@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `yuanx-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `yuanx/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `yuanx/pre-init-PACKAGE' and/or
;;   `yuanx/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst yuanx-packages
  '(
    cheatsheet)
  "The list of Lisp packages required by the yuanx layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

;; /Users/yiddishkop/.emacs.d/elpa/27.2/develop/cheatsheet-20170126.2150/
;; vim cheatsheet.el 修改 format 对齐方式
;; Functions to format cheatsheet items and prepare to print
;; (defun cheatsheet--format-cheat (cheat key-cell-length)
;;   "Format CHEAT row with KEY-CELL-LENGTH key cell length."
;;   ;; 居中对齐
;;   ;;(let* ((format-string (format "%%%ds - %%s\n" key-cell-length))
;;   ;; 左对齐
;;   (let* ((format-string (format "  %%-%ds - %%s\n" key-cell-length))
(defun yuanx/init-cheatsheet ()
  (use-package cheatsheet
    :ensure nil
    :defer f
    :config
    (cheatsheet-add-group 'Layers
			  '(:key "SPC f" :description "File")
			  '(:key "SPC p" :description "Project")
			  '(:key "SPC b" :description "Buffer")
			  '(:key "SPC SPC" :description "Major mode")
			  '(:key "SPC g" :description "Git")
			  '(:key "SPC h" :description "Help")
			  )
    
    (cheatsheet-add-group 'Emacs
			  '(:key "SPC '" :description "Terminal")
			  '(:key "SPC q q" :description "Exit Emacs")
			  '(:key "SPC q r" :description "Restart Emacs")
			  )
    
    (cheatsheet-add-group 'Window
			  '(:key "SPC w s / SPC w -" :description "水平分割窗口")
			  '(:key "SPC w v / SPC w /" :description "竖直分割窗口")
			  '(:key "SPC w d" :description "删除当前窗口")
			  )
    
    (cheatsheet-add-group 'File
			  '(:key "SPC f f" :description "New / Open file")
			  '(:key "SPC f R" :description "Rename current file")
			  '(:key "SPC f D" :description "Delete current file")
			  '(:key "SPC f r" :description "Open recent file list")
			  '(:key "SPC f c" :description "Copy file")
			  '(:key "SPC f s" :description "Save file")
			  '(:key "SPC t n" :description "Line number")
			  )
    
    (cheatsheet-add-group 'Buffer
			  '(:key "SPC b b" :description "显示已经打开的 buffer")
			  '(:key "SPC b d" :description "关闭当前 buffer")
			  '(:key "SPC b h" :description "进入 Spacemacs 初始界面")
			  '(:key "SPC b N" :description "新建一个 buffer")
			  '(:key "SPC b R" :description "从自动备份的文件中恢复")
			  '(:key "SPC b Y" :description "复制整个 buffer 的内容")
			  '(:key "SPC b P" :description "将剪贴板的内容粘贴到整个 buffer")
			  '(:key "SPC Tab" :description "切换至上一个 buffer")
			  )

    (cheatsheet-add-group 'Git
			  '(:key "SPC g i" :description "git init")
			  '(:key "SPC g s" :description "git status, 进入 Magit 管理模式")
			  '(:key "SPC g P" :description "git push")
			  '(:key "SPC g s s" :description "git add")
			  '(:key "SPC g c c" :description "git commit")
			  '(:key "SPC g l l" :description "git log")
			  '(:key "SPC g s u" :description "git checkout -- xxxxx")
			  '(:key "SPC g s x" :description "git reset -- hard xxxxx")
			  )

    (cheatsheet-add-group 'Org-table
                          '(:key ", t n" :description "创建表格")
                          '(:key ", t a" :description "触发自动对齐")
                          '(:key ", t i r" :description "在当前行上方插入一行")
                          '(:key ", t i c" :description "在当前列左边插入一列")
                          '(:key ", t i h" :description "在当前行下面插入水平线")
                          '(:key ", t d r" :description "删除当前行(vim 模式下可以通过 dd 删除)")
			  '(:key ", t d c" :description "删除当前列")
			  )
    (cheatsheet-add-group 'Org-common
			  '(:key "/text/" :description "斜体 => Markdown: *text*")
			  '(:key "*text*" :description "加粗 => Markdown: **text**")
			  '(:key "[[url][desc]]" :description "link => Markdown: [description](url)")
			  '(:key "[[url][desc]]" :description "image => Markdown: ![description](url)")
			  '(:key "=code= or ~code~" :description "code inline => Markdown: `code`")
			  '(:key "#+BEGIN_SRC" :description "code block #+BEGIN_SRC js <code> #+END_SRC")
			  '(:key "#+BEGIN_SRC" :description "code block => Markdown: ```js <code> ```")
			  '(:key "#+BEGIN_QUOTE" :description "quote #+BEGIN_QUOTE <text> #+END_QUOTE")
			  '(:key "#+BEGIN_QUOTE" :description "quote => Markdown: > text")
			  '(:key "SPC m e e" :description "导出 Org 为各种格式，如 HTML、LaTeX、PDF 等")
			  )
    (cheatsheet-add-group 'Org-GTD
			  '(:key "," :description "等价于 SPC m, 打开 org controller plane")
			  '(:key "- [ ] xxx" :description "添加待办事项")
                          '(:key "C-c C-c" :description "标记待办事项为已完成")
                          '(:key "head + [/] or [%]" :description "自动计算进度")
                          '(:key "C-c C-t or , T T" :description "为该标题添加 TODO 标记, 再执行会把 TODO 替换成 DONE")
                          '(:key "#+SEQ_TODO" :description "#+SEQ_TODO: NEXT(n) TODO(t) WAITING(w) | DONE(d) CANCELLED(c)")
                          '(:key "#+SEQ_TODO" :description "自定义 GTD 状态")
                          '(:key ", , (未生效)" :description "把子任务设置成完成/未完成状态")
                          '(:key ", T T" :description "激活 TODO 项的设置")
                          '(:key "SHIFT-<left>" :description "设置 TODO 状态")
                          '(:key "SHIFT-<right>" :description "设置 TODO 状态")
			  )
    ))
