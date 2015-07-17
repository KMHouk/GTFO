require 'geocoder'

class InstagramController < ApplicationController
  def convert
    @insta = params[:choice]
    location = Geocoder.search(@insta)
    @@latitude = location[0].latitude
    @@longitude = location[0].longitude
    redirect_to action: "index"
  end

  def index
    @instagram = Instagram.media_search("#{@@latitude}", "#{@@longitude}", {:count => 18})
  end

end
