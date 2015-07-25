require "test_helper"

class PageTest < ActiveSupport::TestCase

  def page
    @page ||= Page.new
  end

  def test_valid
    assert page.valid?
  end

end
