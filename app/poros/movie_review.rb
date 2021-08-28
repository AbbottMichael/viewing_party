class MovieReview
  attr_reader :author,
              :content,
              :total_results

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
    @total_results = data[:total_results]
  end
end
