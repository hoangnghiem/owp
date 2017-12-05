# == Schema Information
#
# Table name: memberships
#
#  id          :integer          not null, primary key
#  business_id :integer
#  user_id     :integer
#  role        :string
#  owner       :boolean          default(FALSE)
#  boolean     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Membership < ApplicationRecord
  enum role: [ :admin, :staff, :sales_agent ]

  belongs_to :business, inverse_of: :memberships
  belongs_to :user, inverse_of: :memberships
end
