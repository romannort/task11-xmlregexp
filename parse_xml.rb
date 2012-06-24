def parse_xml( xml_string )
  xml_string.match( /\A
    \s*(<\s*volume\s*>\s*
    (
    (?'file_tag'\s*<\s*file\s*(name\s*=\s*".*")?\s*\/\s*>\s*
    )
    |
    (?'folder_tag'\s*<\s*folder\s*(name\s*=\s*".*")?\s*>\s*
    (\g'file_tag'|\g'folder_tag')*
    \s*<\s*\/\s*folder\s*>\s*)
    )*
    \s*<\s*\/\s*volume\s*>)*\s*\z/x ).to_s == xml_string
end