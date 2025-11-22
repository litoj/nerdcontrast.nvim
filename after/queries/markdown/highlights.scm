;; extends
((atx_h1_marker) @markup.heading.marker (#set! conceal "Ⅰ"))
((atx_h2_marker) @markup.heading.marker (#set! conceal "Ⅱ"))
((atx_h3_marker) @markup.heading.marker (#set! conceal "Ⅲ"))
((atx_h4_marker) @markup.heading.marker (#set! conceal "Ⅳ"))
((atx_h5_marker) @markup.heading.marker (#set! conceal "Ⅴ"))
((atx_h6_marker) @markup.heading.marker (#set! conceal "Ⅵ"))

(fenced_code_block
  (fenced_code_block_delimiter) @markup.raw.delimiter)
