module ApplicationHelper
  def my_name
    "BenGoZen"
  end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def error_classes(errors)
    if errors.any?
      'form-group has-error'
    else
      'form-group'
    end
  end

  def vote_link_classes(post, type)
    base_class = "glyphicon glyphicon-chevron-"
    if type == 'up'
      base_class << "up"
      base_class << " voted" if current_user.voted(post) && current_user.voted(post).up_vote?
    elsif type == 'down'
      base_class << "down"
      base_class << " voted" if current_user.voted(post) && current_user.voted(post).down_vote?      
    end
    base_class
  end
end
