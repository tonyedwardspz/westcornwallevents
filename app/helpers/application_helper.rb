module ApplicationHelper
  def getYear
    if params[:year]
      @choosen_year = params[:year]
    else
      @choosen_year = DateTime.now.year
    end
  end

  def format_url(url)
    if url.start_with?('http://')
      url.slice! 'http://'
    end

    if url.start_with?('https://')
      url.slice! 'https://'
    end

    if !url.start_with?('www.')
      url.prepend!('www.')
    end

    if url.end_with?('/')
      url.chomp!('/')
    end
    url
  end
end
