class MoviePoster
  attr_reader :file_path,
              :url

  def initialize(data)
    @url = 'https://www.themoviedb.org/t/p/w300_and_h450_bestv2'
    @file_path = data[:file_path]
  end
end
