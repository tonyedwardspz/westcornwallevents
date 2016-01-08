module AdminHelper
  def fa_to(icon_name)
    content_tag(:i, nil, :class => "fa #{icon_name}")
  end
end
