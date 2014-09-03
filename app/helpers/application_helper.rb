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
end
