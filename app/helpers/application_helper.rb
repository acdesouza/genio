module ApplicationHelper
  def action_title(title)
    project_name = 'Cartolla'

    content_for :page_title, "#{title} | #{project_name}"
  end
end
