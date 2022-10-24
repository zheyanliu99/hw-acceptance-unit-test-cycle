require 'rails_helper.rb'

# demo with fixtures and models
# describe Movie do
#   fixtures :movies
#   it 'includes rating and year in full name' do
#     movie = movies(:milk_movie)
#     expect(movie.title).to eq('Milk')
#   end
# end

# describe Movie do
#   it 'should include rating and year in full name' do
#     # 'build' creates but doesn't save object; 'create' also saves it
#     movie = FactoryBot.build(:movie, :title => 'Milk', :rating => 'R')
#     expect(movie.rating).to eq 'R'
#   end
# end


describe Movie do
  describe '.find_similar_movies' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'Catch me if you can', director: 'Steven Spielberg') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'Seven', director: 'David Fincher') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "Schindler's List", director: 'Steven Spielberg') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "Stop") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.similar_movies(movie1.title)).to eql(['Catch me if you can', "Schindler's List"])
        expect(Movie.similar_movies(movie1.title)).to_not include(['Seven'])
        expect(Movie.similar_movies(movie2.title)).to eql(['Seven'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.similar_movies(movie4.title)).to eql(nil)
      end
    end
  end

end


