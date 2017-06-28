class Attributes::DowncasedString < Virtus::Attribute

  def coerce(value)
    value && value.to_s.strip.downcase
  end
  
end
