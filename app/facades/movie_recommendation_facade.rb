class MovieRecommendationFacade

  def self.movie_recommendations_fetch(params_id)
    json = MovieService.new.get_movie_recommendations(params_id)
    json[:results][0..4].map do |review|
      MovieRecommendation.new(review)
    end
  end
end
