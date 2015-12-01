module PetsHelper
  def color_to_class(color)
    "color-#{color}"
  end

  def pretty_text_field(f,field)
    content_tag(:div, nil, class: 'form-group') do |content|
      f.label(field) + ' ' + f.text_field(field, :class => 'form-control')
    end
  end
end