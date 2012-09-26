module ApplicationHelper

  def full_title(page_title)
    base_title='James awesome Ruby tutorial sample app'
    if page_title.empty?
      base_title
        "#{base_title} | #{page_title}"
    end    
  end
end
