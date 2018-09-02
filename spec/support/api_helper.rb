module ApiHelper
  def response_body
    JSON.parse(response.body)
  end

  def headers
    { 'Accept' => 'application/vnd.api+json', 'Content-Type' => 'application/vnd.api+json' }
  end
end
