module ApplicationHelper
  def title
    base_title = "Geade Stub"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
