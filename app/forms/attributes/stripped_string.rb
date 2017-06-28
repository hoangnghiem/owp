class Attributes::StrippedString < Virtus::Attribute

  def coerce(value)
    value && value.to_s.strip
  end
  
end
