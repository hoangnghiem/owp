class Billing::Plan < ApplicationRecord
  serialize :quota, Billing::Quota
  monetize :price_cents
end
