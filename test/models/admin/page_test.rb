require "test_helper"

class Admin::PageTest < ActiveSupport::TestCase

  def page
    @page ||= Admin::Page.new
  end

  def test_valid
    assert page.valid?
  end

end
