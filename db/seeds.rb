# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Billing::Plan.create!(
#   stripe_id: '',
#   name: 'Free',
#   currency: 'usd',
#   price: 0,
#   trial_period_days: 14,
#   quota: Billing::Quota.new(active_order_sheets: 1)
# )
#
# pro = Billing::Plan.create(
#   stripe_id: 'pro',
#   name: 'Pro',
#   currency: 'usd',
#   price: 29.00,
#   interval: 'month',
#   highlight: true,
#   quota: Billing::Quota.new(active_order_sheets: 5)
# )
#
# begin
#   stripe_pro = Stripe::Plan.retrieve(pro.stripe_id)
#   stripe_pro.delete
# rescue Exception => e
#   puts e.message
# ensure
#   Stripe::Plan.create(
#     amount: pro.price_cents,
#     interval: pro.interval,
#     name: pro.name,
#     currency: pro.currency,
#     id: pro.stripe_id
#   )
# end
