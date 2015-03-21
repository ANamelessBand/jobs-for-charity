module ApplicationHelpers
  def glyphicon_span(name)
    "<span class='glyphicon glyphicon-#{name}'></span>"
  end

  def set_active_navigation_link(active_id)
      navigation_links.each { |link| link.active = link.id == active_id }
  end
  
  def to_link(href, title, class_name = nil)
      class_tag = class_name.nil? ? '' : "class='#{class_name}'"
      "<a #{class_tag} href='#{href}'>#{title}</a>"
    end
end
