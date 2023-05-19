class UnsplashService
  def fetch_api
    response = conn.get
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.unsplash.com/photos/random") do |faraday|
      faraday.params["client_id"] = ENV["UNSPLASH_API_KEY"]
      faraday.params["count"] = 1
      # can add more if needed
    end
  end
end
