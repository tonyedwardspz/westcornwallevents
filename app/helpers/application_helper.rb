module ApplicationHelper
  def getYear
    if params[:year]
      @choosen_year = params[:year]
    else
      @choosen_year = DateTime.now.year
    end
  end
end
