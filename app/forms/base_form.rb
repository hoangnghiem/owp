# Base Form Object
# ---------------------------------------------------
# handles the parsing and validating the input format, 
# actually performing work in the Service object.
class BaseForm
  include ActiveModel::Model 
  include ActiveModelAttributes
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  before_validation :clean_attributes

  attr_reader :attributes

  def attributes
    raise NotImplementedError
  end

  protected

  def clean_attributes
    attributes.each do |attr, val|
      if val.respond_to?(:strip)
        self.send("#{attr.to_s}=", val.strip)
      end
    end
  end

end
