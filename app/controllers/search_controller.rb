class SearchController < ApplicationController
  skip_before_action :authorize

  def results
    @results = PgSearch.multisearch(params[:q])
  end
end
