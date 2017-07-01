require "test_helper"
require "capybara/poltergeist"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :firefox, screen_size: [1200, 800]
  driven_by :poltergeist
end
