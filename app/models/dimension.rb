class Dimension
  include ActiveModel::Model 
  include Virtus.value_object
  
  values do
    attribute :length, Float
    attribute :width, Float
    attribute :height, Float
    attribute :unit, String
  end
  
end
