# == Schema Information
#
# Table name: merchants
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Merchant < ApplicationRecord
  has_many :merchant_staffs
  has_many :users, through: :merchant_staffs
  has_many :admins, -> { where(merchant_staffs: { role: MerchantStaff.roles[:admin] }) }, through: :merchant_staffs, source: :user

  def owner
    admins.order('created_at ASC').first
  end

end
