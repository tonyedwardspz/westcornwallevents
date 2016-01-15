class SearchController < ApplicationController
  skip_before_action :authorize

  def results
    if params['q'].present? && params['q'].length > 0
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
        elsif r.class.name == "Blog"
          @search_blogs << r
        elsif r.class.name == "Festival"
          @search_festivals << r
        elsif r.class.name == "Venue"
          @search_venues << r
        end
      end

      @page_title = "#{params['q']} - Search Results"
      @search_future_events.sort_by{|e| e[:date]}
    else
      @page_title = "Search Results"
    end
  end
end
