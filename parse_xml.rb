def parse_xml( xml_string )
  xml_string.match( /\A
    \s*<\s*volume\s*>\s*
    (?'file_tag_wrapper'
    \s*<\s*file\s*(name=\".*\")?>\s*<\s*\/\s*file\s*>\s*
    )*
    (?'folder_tag'\s*<\s*folder\s*(name=\".*\")?>\s*
    \g'file_tag_wrapper'*
    \g'folder_tag'*\s*<\s*\/\s*folder\s*>\s*)*
    \g'file_tag_wrapper'*
    \s*<\s*\/\s*volume\s*>\s*\z/x  ).to_s == xml_string
end