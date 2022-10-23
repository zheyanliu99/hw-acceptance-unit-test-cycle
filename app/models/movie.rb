class Movie < ActiveRecord::Base
  def self.similar_movies movie_title
    # we should not search by movie title.... It may not be unique
    director = Movie.where(title: movie_title).take.director
    return nil if director.blank? or director.nil?

    res = Movie.where(director: director).pluck(:title)
    res
  end
end
