require "test_helper"

class VenueTest < ActiveSupport::TestCase

  def venue
    @venue ||= Venue.new
  end

  def test_valid
    assert venue.valid?
  end

end
