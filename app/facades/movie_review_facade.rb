class MovieReviewFacade
  def self.movie_reviews_fetch(params_id)
    json = MovieService.get_movie_reviews(params_id)
    json[:results].map do |review|
      MovieReview.new(review)
    end
  end
end
