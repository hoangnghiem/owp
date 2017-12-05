# == Schema Information
#
# Table name: billing_plans
#
#  id                :integer          not null, primary key
#  stripe_id         :string
#  name              :string
#  currency          :string
#  price_cents       :integer          default(0), not null
#  price_currency    :string           default("USD"), not null
#  interval          :string
#  displayable       :boolean          default(TRUE)
#  highlight         :boolean          default(FALSE)
#  quota             :jsonb            not null
#  trial_period_days :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Billing::Plan < ApplicationRecord
  serialize :quota, Billing::Quota
  monetize :price_cents
end
