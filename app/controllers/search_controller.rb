class SearchController < ApplicationController
  skip_before_action :authorize

  def results
    if params['q'].present?
      @results = PgSearch.multisearch(params[:q])
      @search_future_events = []
      @search_past_events = []
      @search_blogs = []
      @search_festivals = []
      @search_venues = []
      @results.each do |result|
        r = result.searchable
        if r.class.name == "Event"
          if r.date > DateTime.now
            @search_future_events << r
          else
            @search_past_events << r
          end
        end
      end
      @page_title = "#{params['q']} - Search Results"
    else
      @page_title = "Search Results"
    end
  end
end
