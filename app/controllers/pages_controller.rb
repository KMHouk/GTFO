class PagesController < ApplicationController
    
    def home
    end
    
    before_action :require_user, :except => [:index]
    
    def locations
    end
    
#the views of flights/ pics/ etc. should be listed under the "befre_action" command above.
#any view we allow on the home page will be visible to all users, whether or not they're signed in.
    
end
