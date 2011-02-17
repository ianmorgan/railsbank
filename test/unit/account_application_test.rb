require 'test_helper'

class AccountApplicationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_generation_of_confirmation_code
    a = AccountApplication.new
    assert_nil a.confirmation_code, 'Confirmation code must be nil on newly created objects'
    a.generate_confirmation_code
    assert_not_nil a.confirmation_code, 'Confirmation code should have been generated'
    code = a.confirmation_code
    a.generate_confirmation_code
    assert_equal code, a.confirmation_code, 'Confirmation code cannot change once generated' 
  end
end

