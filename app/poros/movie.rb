class Movie
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genre_ids,
              :overview,
              :cast,
              :vote_count,
              :reviewer_info

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    # @runtime = data[:runtime]
    @genre_ids = data[:genre_ids]
    @overview = data[:overview]
    # @cast = data[:cast]
    @vote_count = data[:vote_count]
    # @reviewer_info = [:reviewer_info]
  end
end
