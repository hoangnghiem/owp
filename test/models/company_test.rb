require 'test_helper'

class CompanyTest < ActiveSupport::TestCase

  test "slug" do
    company = create(:company, name: 'Tutudumonde')
    
    assert_equal 'tutudumonde', company.slug
  end

end
