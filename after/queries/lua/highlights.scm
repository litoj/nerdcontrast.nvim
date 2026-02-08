;; extends

(function_declaration
  name: (identifier) @function.decl)

(function_declaration
  name: (dot_index_expression (_) (identifier) @function.method.decl))

(break_statement) @keyword.return
