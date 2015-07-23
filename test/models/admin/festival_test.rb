require "test_helper"

class Admin::FestivalTest < ActiveSupport::TestCase

  def festival
    @festival ||= Admin::Festival.new
  end

  def test_valid
    assert festival.valid?
  end

end
