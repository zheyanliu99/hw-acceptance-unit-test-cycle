require 'rails_helper'


describe MoviesHelper do 

  it 'returns odd' do 
    expect(oddness(3)).to eq('odd')
  end

  it 'returns even' do 
    expect(oddness(10)).to eq('even')
  end
end