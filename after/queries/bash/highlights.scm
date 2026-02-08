;; extends

(command_name
  (word) @keyword.return
  (#match? @keyword.return "^(break|continue|return)$"))
