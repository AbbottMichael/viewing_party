class MovieService

  def get_movie_details(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US"
    get_data(endpoint)
  end

  def get_movie_cast(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US"
    get_data(endpoint)
  end

  def get_movie_reviews(movie_id)
    endpoint = "https://api.themoviedb.org/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US&page=1"
    get_data(endpoint)
  end

  def get_popular_movies_1
    endpoint = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1"
    get_data(endpoint)
  end

  def get_popular_movies_2
    endpoint = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=2"
    get_data(endpoint)
  end

  def get_data(endpoint)
    response = Faraday.get(endpoint)
    JSON.parse(response.body, symbolize_names: true)
  end
end
