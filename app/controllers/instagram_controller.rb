class InstagramController < ApplicationController

  def convert
    @insta = params[:choice]
    location = Geocoder.search(@insta)
    @@latitude = location[0].latitude
    @@longitude = location[0].longitude
    redirect_to action: "index", arrival_city: @insta, departing_city: params[:city], destination_city_airport: params[:destination_city_airport]
  end

  def index
    @instagram = Instagram.media_search("#{@@latitude}", "#{@@longitude}", {:count => 18})
    @arrival_city = params[:arrival_city]
    @arrival_city_airport = params[:destination_city_airport]
    @departing_city = params[:departing_city]
    earliest_departure_date = Time.now.strftime("%Y-%m-%d")
    # latest_departure_date = Time.now.strftime("%Y-%m-%d") + 2.days
    latest_departure_date = "2015-07-23"
    # fares = SabreDevStudio::Base.get("/v1/historical/flights/fares?origin=#{@departing_city}&destination=#{@arrival_city}&earliestdeparturedate=#{earliest_departure_date}&latestdeparturedate=#{latest_departure_date}&lengthofstay=7")
    fares = SabreDevStudio::Base.get("/v1/historical/flights/fares?origin=#{@departing_city}&destination=#{@arrival_city_airport}&earliestdeparturedate=2015-07-17&latestdeparturedate=2015-07-22&lengthofstay=7")
    @parsed_fares = JSON.parse(fares.body)
  end

end
