require 'geocoder'

class Api::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    Link.create(link_params)
    head :ok
  end

  def show
    return redirect_to :root unless link
    link.track_visitor(request.location.data)
    redirect_to link.original_url
  end

  private

  def link
    @link = Link.find_by(short_code: link_params[:short_code])
  end

  def link_params
    params.permit(:original_url, :short_code)
  end
end
