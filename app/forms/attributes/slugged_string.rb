class Attributes::SluggedString < Virtus::Attribute

  def coerce(value)
    value && value.to_s.strip.parameterize
  end
  
end
