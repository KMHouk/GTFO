class InstagramController < ApplicationController
  def index
    @instagram = Instagram.media_search("37.7808851", "-122.3948632", {:count => 1})
  end
end
