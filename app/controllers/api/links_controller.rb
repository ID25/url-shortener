class Api::LinksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    Link.create(link_params)
    head :ok
  end

  def show
    path = link ? link.original_url : :root
    redirect_to path
  end

  private

  def link
    @link = Link.find_by(short_code: link_params[:short_code])
  end

  def link_params
    params.permit(:original_url, :short_code)
  end
end
