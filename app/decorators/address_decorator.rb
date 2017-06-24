class AddressDecorator < ApplicationDecorator
  delegate_all

  def display_country
    country.present? ? Carmen::Country.coded(country).name : ''
  end

  def display_state
    return '' unless country.present?
    subregions = Carmen::Country.coded(country).subregions
    subregions.coded(state).name
  end

end
