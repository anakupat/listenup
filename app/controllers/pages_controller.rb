class PagesController < ApplicationController

  # def page(page_num)
  #   start = (page_num - 1) * 10

  #   [start, start + 9]
  # end

  def search_spotify(search)


    search_results = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{search}")
  end

  def homepage

  end

  def search

  end

  def search_results
    if params[:page]
      @page = params[:page].to_i
    else
      @page = 1
    end

    start = (@page - 1) * 5

    search = params[:search].to_s.gsub(" ","+")
    @results = search_spotify(search)["tracks"][start..start + 4]
    render('search_results')
  end
end
