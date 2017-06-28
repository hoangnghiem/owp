class CompanyForm < BaseForm
  attribute :name, Attributes::TitleizedString

  validates :name, presence: true
end
