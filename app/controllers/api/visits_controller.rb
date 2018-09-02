class Api::VisitsController < ActionController::API
  def index
    render json: visits_data
  end

  private

  def visits_data
    Visit.latest(10).as_json(methods: :visited_at,
                      except: %i[id link_id created_at updated_at],
                      include: { link: { except: %i[id created_at updated_at] } })
  end
end
