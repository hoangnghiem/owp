# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  company_id :integer
#  user_id    :integer
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Membership < ApplicationRecord
  enum role: [ :admin, :staff, :sales_agent ]

  belongs_to :company, inverse_of: :memberships
  belongs_to :user, inverse_of: :memberships
end
