class InstagramController < ApplicationController
  def index
    @instagram = Instagram.media_search("40.7127", "74.0059", {:count => 12})
  end

  def convert
    @insta = params[:insta]


  end

end
