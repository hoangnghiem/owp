class Attributes::TitleizedString < Virtus::Attribute

  def coerce(value)
    value && value.to_s.strip.titleize
  end
  
end
