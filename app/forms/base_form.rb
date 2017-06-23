# Base Form Object
# ---------------------------------------------------
# handles the parsing and validating the input format, 
# actually performing work in the Service object.
class BaseForm
  include ActiveModel::Model 
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include Virtus.model

  before_validation :clean_attributes

  protected

  def clean_attributes
    attributes.each do |attr, val|
      if val.respond_to?(:strip)
        self.send("#{attr.to_s}=", val.strip)
      end
    end
  end

end
