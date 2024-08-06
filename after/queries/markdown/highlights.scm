;; extends
((atx_h1_marker) @markup.heading.marker (#set! conceal "Ⅰ"))
((atx_h2_marker) @markup.heading.marker (#set! conceal "Ⅱ"))
((atx_h3_marker) @markup.heading.marker (#set! conceal "Ⅲ"))
((atx_h4_marker) @markup.heading.marker (#set! conceal "Ⅳ"))
((atx_h5_marker) @markup.heading.marker (#set! conceal "Ⅴ"))
((atx_h6_marker) @markup.heading.marker (#set! conceal "Ⅵ"))

(fenced_code_block
  (fenced_code_block_delimiter) @markup.raw.delimiter)

(setext_heading
  (paragraph) @markup.headingalt.1
  (setext_h1_underline) @markup.headingalt.1)

(setext_heading
  (paragraph) @markup.headingalt.2
  (setext_h2_underline) @markup.headingalt.2)

(atx_heading
  (atx_h1_marker) (inline) @markup.headingalt.1)

(atx_heading
  (atx_h2_marker) (inline) @markup.headingalt.2)

(atx_heading
  (atx_h3_marker) (inline) @markup.headingalt.3)

(atx_heading
  (atx_h4_marker) (inline) @markup.headingalt.4)

(atx_heading
  (atx_h5_marker) (inline) @markup.headingalt.5)

(atx_heading
  (atx_h6_marker) (inline) @markup.headingalt.6)
