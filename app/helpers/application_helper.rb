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
    classes = "glyphicon"
    if type == 'up'
      classes << " glyphicon-chevron-up"
      classes << " voted" if current_user.voted(post).try(:up_vote?)
    elsif type == 'down'
      classes << " glyphicon-chevron-down"
      classes << " voted" if current_user.voted(post).try(:down_vote?)  
    end
    classes
  end
end
