class Weight
  include ActiveModel::Model 
  include Virtus.value_object
  
  values do
    attribute :value, Float
    attribute :unit, String
  end
  
end
