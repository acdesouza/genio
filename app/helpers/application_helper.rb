module ApplicationHelper
  def action_title(title)
    project_name = 'Cartolla'

    content_for :page_title, "#{project_name} | #{title}"
    content_tag :h1, title
  end
end
