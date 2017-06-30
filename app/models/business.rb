# == Schema Information
#
# Table name: businesses
#
#  id         :integer          not null, primary key
#  name       :string
#  slug       :string
#  address    :string           default("{}"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Business < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  serialize :address, Address

  has_many :memberships
  has_many :users, through: :memberships
  has_many :admins, -> { where(memberships: { role: Membership.roles[:admin] }) }, through: :memberships, source: :user
  has_many :staffs, -> { where(memberships: { role: Membership.roles[:staff] }) }, through: :memberships, source: :user
  has_many :agents, -> { where(memberships: { role: Membership.roles[:agents] }) }, through: :memberships, source: :user

  # First created admin is consider the owner of the company
  def owner
    admins.order(:created_at).first
  end
end
