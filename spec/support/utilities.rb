
# Moved here in Section 5.3.4 
def full_title(page_title)
  base_title = 'Ruby on Rails Training'
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end
