class SubmitEventController < ApplicationController
  skip_before_action :authorize, only: [:index]
  def index
    @page_title = 'Submit Event'
  end
end
