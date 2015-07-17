class InstagramController < ApplicationController

  def convert
    @insta = params[:choice]
    location = Geocoder.search(@insta)
    @@latitude = location[0].latitude
    @@longitude = location[0].longitude
    redirect_to action: "index", :arrival_city => @insta
  end

  def index
    @instagram = Instagram.media_search("#{@@latitude}", "#{@@longitude}", {:count => 18})
    @arrival_city = params[:arrival_city]
  end

end
