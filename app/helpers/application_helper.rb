module ApplicationHelper
  def action_title(title)
    project_name = 'Cartolla'

    content_for :page_title, "#{project_name} | #{title}"
  end
end
