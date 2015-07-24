require "test_helper"

class Admin::VenueTest < ActiveSupport::TestCase

  def venue
    @venue ||= Admin::Venue.new
  end

  def test_valid
    assert venue.valid?
  end

end
