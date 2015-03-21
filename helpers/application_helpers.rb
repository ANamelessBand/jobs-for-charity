module ApplicationHelpers
  def glyphicon_span(name)
    "<span class='glyphicon glyphicon-#{name}'></span>"
  end

<<<<<<< HEAD
  def set_active_navigation_link(active_id)
      navigation_links.each { |link| link.active = link.id == active_id }
  end
  
  def to_link(href, title, class_name = nil)
      class_tag = class_name.nil? ? '' : "class='#{class_name}'"
      "<a #{class_tag} href='#{href}'>#{title}</a>"
    end
=======
  def show_tasks_table(tasks)
    @tasks_collection = tasks
    erb :'tasks_table.html'
  end
>>>>>>> Add a dashboard view.
end
