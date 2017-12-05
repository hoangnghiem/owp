class Attributes::UpcasedString < Virtus::Attribute

  def coerce(value)
    value && value.to_s.strip.upcase
  end
  
end
