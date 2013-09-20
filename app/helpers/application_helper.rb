module ApplicationHelper

  def nav_link(link_text, link_path)
    class_value = (request.original_fullpath.include? link_path) ? 'active' : ''
    content_tag(:li, :class => class_value) do
      link_to link_text, link_path
    end
  end

end