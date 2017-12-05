class LocaleSetting
  include ActiveModel::Model 
  include Virtus.model

  attribute :dimension_unit, String, default: 'in'
  attribute :weight_unit, String, default: 'lbs'
  attribute :currency, String, default: 'USD'

  def self.load(json)
    setting = self.new
    unless json.nil?
      attrs = JSON.parse(json)
      setting.attributes = attrs
    end
    setting 
  end

  def self.dump(setting)
    setting.attributes.to_json if setting
  end
  
end
