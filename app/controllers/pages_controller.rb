require 'sabre_dev_studio-flight'

class PagesController < ApplicationController

    before_action :get_flight_data, :only => [:flights]
    before_action :require_user, :except => [:index]

    def home
    end

    def locations
    end

    def flights
    end

    def results
    end

    protected

    def get_flight_data
      @city = params[:city]
      # @flights = SabreDevStudio::Base.get("/v1/lists/top/destinations?origin=#{@city}&topdestinations=5")
      @flights = SabreDevStudio::Base.get('/v1/shop/themes')
    end

end
