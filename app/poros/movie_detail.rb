class MovieDetail
  attr_reader :title,
              :runtime,
              :genres,
              :overview,
              :vote_average

  def initialize(data)
    @title = data[:title]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @vote_average = data[:vote_average]
  end

  def format_time
    "#{self.runtime / 60}h #{self.runtime % 60}min"
  end
end
