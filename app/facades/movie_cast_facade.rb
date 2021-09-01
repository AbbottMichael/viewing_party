class MovieCastFacade
  def self.movie_cast_fetch(params_id)
    json = MovieService.new.get_movie_cast(params_id)
    json[:cast][0..9].map do |cast_member|
      MovieCast.new(cast_member)
    end
  end
end
