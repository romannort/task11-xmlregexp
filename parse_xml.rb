def parse_xml( xml_string )
  xml_string.match( /\A
    <volume>
    (?'file_tag_wrapper'
    (?'file_tag'<file>\s*<\/file>*)*
    )*
    (?'folder_tag'<folder>\g'file_tag_wrapper'\g'folder_tag'*<\/folder>)*
    \g'file_tag_wrapper'
    <\/volume>*\z/x  ).to_s == xml_string
end