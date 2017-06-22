# == Schema Information
#
# Table name: merchant_staffs
#
#  id          :integer          not null, primary key
#  merchant_id :integer
#  user_id     :integer
#  role        :integer          default("admin")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class MerchantStaff < ApplicationRecord
  enum role: [ :admin, :staff, :sales_agent ]

  belongs_to :merchant
  belongs_to :user
end
