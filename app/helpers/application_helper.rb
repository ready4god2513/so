module ApplicationHelper

  def title(page_title, meta_title = page_title, options = {})
    meta_title = meta_title.blank? ? page_title : meta_title
    content_for(:title, truncate(meta_title.gsub(/[^0-9A-Za-z--\/'\. ]/, ''), length: 75) + " | Stack Overflow")
    content_tag(:h1, page_title, options.merge!(class: "page-header"))
  end

end
