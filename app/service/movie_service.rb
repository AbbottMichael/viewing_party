class MovieService
  def self.get_movie_recommendations(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/recommendations?api_key=#{ENV['movie_api_key']}&language=en-US&page=1"
    get_data(endpoint)
  end

  def self.get_movie_poster(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/images?api_key=#{ENV['movie_api_key']}"
    get_data(endpoint)
  end

  def self.get_movie_search(search_param)
    endpoint = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&page=1&include_adult=false&query=#{search_param}"
    endpoint2 = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&page=2&include_adult=false&query=#{search_param}"
    page1 = get_data(endpoint)
    page2 = get_data(endpoint2)
    page1.merge(page2) { |_key, page1_v, page2_v| page1_v + page2_v }
  end

  def self.get_movie_details(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US"
    get_data(endpoint)
  end

  def self.get_movie_cast(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US"
    get_data(endpoint)
  end

  def self.get_movie_reviews(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US&page=1"
    get_data(endpoint)
  end

  def self.get_top_rated_movies
    endpoint = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1"
    endpoint2 = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=2"
    page1 = get_data(endpoint)
    page2 = get_data(endpoint2)
    page1.merge(page2) { |_key, page1_v, page2_v| page1_v + page2_v }
  end

  def self.get_data(endpoint)
    response = Faraday.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end
end
