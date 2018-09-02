class Api::LinksController < ActionController::API
  def create
    link = Link.new(link_params)
    if link.valid?
      link.save
      head :ok
    else
      render json: link.errors.full_messages, status: 400
    end
  end

  private

  def link_params
    params.permit(:original_url, :short_code)
  end
end
