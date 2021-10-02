(identifier) @variable

; Keywords

[
 "alias"
 "begin"
 "break"
 "class"
 "def"
 "defined?"
 "do"
 "end"
 "ensure"
 "module"
 "next"
 "rescue"
 "retry"
 "return"
 "then"
 "yield"
 "undef"
 ] @keyword

[
 "and"
 "or"
 "in"
 "not"
] @keyword.operator

[
 "case"
 "else"
 "elsif"
 "if"
 "unless"
 "when"
 ] @conditional

[
 "for"
 "until"
 "while"
 ] @repeat

(constant) @type

((identifier) @keyword
 (#vim-match? @keyword "^(private|protected|public)$"))

[
 "rescue"
 "ensure"
 ] @exception

((identifier) @exception
 (#vim-match? @exception "^(fail|raise)$"))

; Function calls

(call
   receiver: (constant)? @type
   method: [
            (identifier)
            (constant)
            ] @function
   )

(program
 (call
  (identifier) @include)
 (#vim-match? @include "^(require|require_relative|load)$"))

(class
  (call
    (identifier) @include)
   (#vim-match? @include "^(include|extend)$"))
(module
  (call
    (identifier) @include)
   (#vim-match? @include "^(include|extend)$"))

((identifier) @keyword
 (#vim-match? @keyword "^(block_given\?|iterator\?|alias_method|loop)"))

(class
  (call
    (identifier) @keyword)
   (#vim-match? @keyword "^(attr_reader|attr_writer|attr_accessor)$"))

(module
  (call
    (identifier) @keyword)
   (#vim-match? @keyword "^(attr_reader|attr_writer|attr_accessor)$"))

; Function definitions

(alias (identifier) @function)
(setter (identifier) @function)

(method name: [
               (identifier) @function
               (constant) @type
               ])

(singleton_method name: [
                         (identifier) @function
                         (constant) @type
                         ])

(class name: (constant) @type)
(module name: (constant) @type)
(superclass (constant) @type)

; Identifiers
[
 (class_variable)
 (instance_variable)
 ] @label

((identifier) @variable.builtin
 (#vim-match? @variable.builtin "^__(callee|dir|id|method|send|ENCODING|FILE|LINE)__$"))

((constant) @type
 (#vim-match? @type "^[A-Z\\d_]+$"))

[
 (self)
 (super)
 (global_variable)
 ] @variable.builtin

(method_parameters (identifier) @parameter)
(lambda_parameters (identifier) @parameter)
(block_parameters (identifier) @variable.builtin)
(splat_parameter (identifier) @parameter)
(hash_splat_parameter (identifier) @parameter)
(optional_parameter (identifier) @parameter)
(destructured_parameter (identifier) @parameter)
(block_parameter (identifier) @parameter)
(keyword_parameter (identifier) @symbol)

; TODO: Re-enable this once it is supported
; ((identifier) @function
;  (#is-not? local))

; Literals

[
 (string)
 (bare_string)
 (subshell)
 (heredoc_body)
 (heredoc_beginning)
 (heredoc_end)
 ] @string

[
 (bare_symbol)
 (simple_symbol)
 (delimited_symbol)
 (hash_key_symbol)
 ] @symbol

(pair key: (hash_key_symbol) ":" @symbol)
(regex) @string.regex
(escape_sequence) @string.escape
(integer) @number
(float) @float

[
 (nil)
 (true)
 (false)
 ] @boolean

(comment) @comment

; Operators

[
 "="
 "=>"
 "->"
 "+"
 "-"
 "*"
 "/"
 "||"
 "&&"
 "||="
 "!="
 "=="
 ">"
 "<"
 "<="
 ">="
 "+="
 "-="
 "*="
 "/="
 "<<="
 "%="
 "&="
 "&&="
 "|="
 "**="
 "**"
 "^="
 "<=>"
 "==="
 "=~"
 "!~"
 "!"
 "^"
 "&"
 "%"
 ] @operator

[
 ","
 ";"
 "."
 ] @punctuation.delimiter

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
 ] @punctuation.bracket

(string_array) @string
(string_array ")" @string)
(symbol_array) @symbol
(symbol_array ")" @symbol)

(ERROR) @error

(interpolation
  "#{" @punctuation.special
  "}" @punctuation.special) @none
