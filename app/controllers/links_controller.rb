require 'geocoder'

class LinksController < ApplicationController
  def show
    return redirect_to :root unless link
    link.track_visitor(request.location.data)
    redirect_to link.original_url
  end

  private

  def link
    @link = Link.find_by(short_code: params[:short_code])
  end
end
