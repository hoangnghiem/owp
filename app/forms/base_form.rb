# Base Form Object
# ---------------------------------------------------
# handles the parsing and validating the input format, 
# actually performing work in the Service object.
class BaseForm
  include ActiveModel::Model 
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks
  include Virtus.model
end
