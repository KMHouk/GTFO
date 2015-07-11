class PagesController < ApplicationController
    
    def home
    end
    
    before_action :require_user, :except => [:index]
    
    def locations
    end
    
    def flights
        @city = params[:city]
    end

    def results
    end
    
end
