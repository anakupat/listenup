class PagesController < ApplicationController


def search_spotify(search)
  search_results = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{search}")
end


def homepage


end

def search

end

def search_results
  search = params[:search].to_s.gsub(" ","+")
  @results = search_spotify(search)


    render('search_results')
end

end
