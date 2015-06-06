require "test_helper"

class FestivalTest < ActiveSupport::TestCase

  def festival
    @festival ||= Festival.new
  end

  def test_valid
    assert festival.valid?
  end

end
