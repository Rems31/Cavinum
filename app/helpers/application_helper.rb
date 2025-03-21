module ApplicationHelper
  def color_class(kind)
    case kind
    when "Rouge"
      "badge-red"
    when "Blanc"
      "badge-yellow"
    when "Rosé"
      "badge-pink"
    else
      "badge-default"
    end
  end
end
