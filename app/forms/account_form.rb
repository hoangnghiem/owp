class AccountForm < BaseForm
  attribute :company, CompanyForm, default: CompanyForm.new
  attribute :user, UserForm, default: UserForm.new
  attribute :address, Address, default: Address.new

  def valid?
    company.valid? && user.valid? && address.valid?
  end

end
