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
    latest_departure_date = Time.now + 2.days
    formatted_latest_departure_date = latest_departure_date.strftime("%Y-%m-%d")
    fares = SabreDevStudio::Base.get("/v1/historical/flights/fares?origin=#{@departing_city}&destination=#{@arrival_city_airport}&earliestdeparturedate=#{earliest_departure_date}&latestdeparturedate=#{formatted_latest_departure_date}&lengthofstay=7")
    parsed_fares = JSON.parse(fares.body)
    @minimum_fare = parsed_fares["FareData"][0]["MinimumFare"]
  end

end
