class Billing::Quota 
  include ActiveModel::Model 
  include Virtus.model

  attribute :active_order_sheets, Integer

  def self.load(json)
    quota = self.new
    unless json.nil?
      attrs = JSON.parse(json)
      quota.attributes = attrs
    end
    quota 
  end

  def self.dump(quota)
    quota.attributes.to_json if quota
  end
  
end
